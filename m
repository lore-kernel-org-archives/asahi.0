Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6AD1CEAA4;
	Fri,  1 Nov 2024 19:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730488039; cv=none; b=kSSorwVQOxDfkIKnoOAciZ2S1yEFygrkD0jjXZgc4DWKFJk9zOiFedNzumDXyyUWa0IO3zK6v/Bd3BHjLzTydNqNZRrZwfCyCLkqFAE9CKjzADH5sMJVZ9xVwWhPvs3h8k4Fq/kukqikTZIOKUxlIDpuegpr2n5CzEchmKQoMBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730488039; c=relaxed/simple;
	bh=L0r/aTmbk45f2mBn1V1TXRJtYB+grt2a6Bs54xQ+Hr4=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KiWEzwyHr3IEWYj7/gcKMCzBdm7ExP/ozrOkRqKHE5uG5wp8uyUrW8B4UmHgzkHSiWnj73eYogEbvqlr2wvfLmrWD/8Qk+hTZIUuF5R0Pfe2e7q20u8GULO+cOmqAZcgLbUlA9+Comp0/WShHeafA0q9ujcdMWsDTuMwOnsXfFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LqEo4Jan; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LqEo4Jan"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B43AC4CECD;
	Fri,  1 Nov 2024 19:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1730488038;
	bh=L0r/aTmbk45f2mBn1V1TXRJtYB+grt2a6Bs54xQ+Hr4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LqEo4Jan/5HivANpRvdFnehU5w+dNmXJe3Bs2UfDt8N90Ez9w/XLvNloD9+aB3sEO
	 aGFVsxqrqpNCXJH55+cnx03TxzMQYYXHXBl9ME/onClsg0f5HRskm+nirs3TKl7DSs
	 stZmLjkPYkcJgsJUCHRs5ySVFkIJbMrbXpcztQq8=
Date: Fri, 1 Nov 2024 12:07:17 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Asahi Lina <lina@asahilina.net>
Cc: Sergio Lopez Pascual <slp@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, Jia He
 <justin.he@arm.com>, Yibo Cai <Yibo.Cai@arm.com>, Kirill A. Shutemov
 <kirill.shutemov@linux.intel.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Asahi Lina <lina@asahilina.net>, Sergio Lopez
 Pascual <slp@redhat.com>
Subject: Re: [PATCH] mm: Fix __wp_page_copy_user fallback path for remote mm
Message-Id: <20241101120717.11db30a5abc6378da7910719@linux-foundation.org>
In-Reply-To: <20241101-mm-remote-pfn-v1-1-080b609270b7@asahilina.net>
References: <20241101-mm-remote-pfn-v1-1-080b609270b7@asahilina.net>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 01 Nov 2024 21:08:02 +0900 Asahi Lina <lina@asahilina.net> wrote:

> If the source page is a PFN mapping, we copy back from userspace.
> However, if this fault is a remote access, we cannot use
> __copy_from_user_inatomic. Instead, use access_remote_vm() in this case.
> 
> Fixes WARN and incorrect zero-filling when writing to CoW mappings in
> a remote process, such as when using gdb on a binary present on a DAX
> filesystem.
>
> [  143.683782] ------------[ cut here ]------------
> [  143.683784] WARNING: CPU: 1 PID: 350 at mm/memory.c:2904 __wp_page_copy_user+0x120/0x2bc
>
> ...
>

Thanks.  I assume we should backport this into earlier kernels?

If so, a Fixes: target is desired, to tell people how far back in time
it should be ported.  I think it's

83d116c53058 ("mm: fix double page fault on arm64 if PTE_AF is cleared").


> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3081,13 +3081,18 @@ static inline int __wp_page_copy_user(struct page *dst, struct page *src,
>  			update_mmu_cache_range(vmf, vma, addr, vmf->pte, 1);
>  	}
>  
> +	/* If the mm is a remote mm, copy in the page using access_remote_vm() */
> +	if (current->mm != mm) {
> +		if (access_remote_vm(mm, (unsigned long)uaddr, kaddr, PAGE_SIZE, 0) != PAGE_SIZE)
> +			goto warn;
> +	}
>  	/*
>  	 * This really shouldn't fail, because the page is there
>  	 * in the page tables. But it might just be unreadable,
>  	 * in which case we just give up and fill the result with
>  	 * zeroes.
>  	 */
> -	if (__copy_from_user_inatomic(kaddr, uaddr, PAGE_SIZE)) {
> +	else if (__copy_from_user_inatomic(kaddr, uaddr, PAGE_SIZE)) {
>  		if (vmf->pte)
>  			goto warn;
>  

The coding style ends up being unconventional.  I made these changes:

--- a/mm/memory.c~mm-fix-__wp_page_copy_user-fallback-path-for-remote-mm-fix
+++ a/mm/memory.c
@@ -3081,18 +3081,20 @@ static inline int __wp_page_copy_user(st
 			update_mmu_cache_range(vmf, vma, addr, vmf->pte, 1);
 	}
 
-	/* If the mm is a remote mm, copy in the page using access_remote_vm() */
-	if (current->mm != mm) {
-		if (access_remote_vm(mm, (unsigned long)uaddr, kaddr, PAGE_SIZE, 0) != PAGE_SIZE)
-			goto warn;
-	}
 	/*
-	 * This really shouldn't fail, because the page is there
-	 * in the page tables. But it might just be unreadable,
-	 * in which case we just give up and fill the result with
-	 * zeroes.
+	 * If the mm is a remote mm, copy in the page using access_remote_vm()
 	 */
-	else if (__copy_from_user_inatomic(kaddr, uaddr, PAGE_SIZE)) {
+	if (current->mm != mm) {
+		if (access_remote_vm(mm, (unsigned long)uaddr, kaddr,
+				     PAGE_SIZE, 0) != PAGE_SIZE)
+			goto warn;
+	} else if (__copy_from_user_inatomic(kaddr, uaddr, PAGE_SIZE)) {
+		/*
+		 * This really shouldn't fail, because the page is there
+		 * in the page tables. But it might just be unreadable,
+		 * in which case we just give up and fill the result with
+		 * zeroes.
+		 */
 		if (vmf->pte)
 			goto warn;
 
_

I'll queue this for testing and shall await further review.

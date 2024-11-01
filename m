Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8581E2828
	for <asahi@lists.linux.dev>; Fri,  1 Nov 2024 21:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.63.210.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730495943; cv=none; b=Zi4MSmgv1Gb9vtSbvl2QDo05jwCr30njhlsA5bxYmm5KDMQvgEJ0C8WbB4vcBGKnlEm3crtJQdewZi3ZryO9YbbFlLhdHPfSkzMU/xB+xSA3Uzg+ntUEVStfkuQ1M+Wo7x908uAqakEFfDuP6apClQcWTNQsk1vUTHcne7G1W/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730495943; c=relaxed/simple;
	bh=6xaWDHK0ZNyN36LFqzUXQY5DIxzZYmaCpRo5bz9ox+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K7KJXd+8jpjFbsH+aljQABbRGRu8qf/gPRmJUoB1uPlgVHy0eU6idmVALuqdzrNVdmLpfFsMnFq65neLKwu9ogucpgC2sKicCq8KzpyIKJLPqTHdUHHL78hMKBvp7PlQg/fKerZ6wyJB6W6+bKT/1MsQKyyjpk3DlAFyEyfdQ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net; spf=pass smtp.mailfrom=asahilina.net; dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b=kkEv+4Ow; arc=none smtp.client-ip=212.63.210.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=asahilina.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asahilina.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asahilina.net header.i=@asahilina.net header.b="kkEv+4Ow"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: lina@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id A1DE34346C;
	Fri,  1 Nov 2024 21:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1730495936;
	bh=6xaWDHK0ZNyN36LFqzUXQY5DIxzZYmaCpRo5bz9ox+E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kkEv+4OwzBsXQXmszD5kLkRBzfigfXURZGkf91dJixrpf0LG3xV2OheANLBmrKZ+J
	 2ZQc82ksGX8+ReUzooti37XhXfx4gTT0rL8Ya4JrMSKwmSyKh8G98ibyTwwfjnkNu8
	 CPujMMIU5HPWrZYc4RaCyEQNo/FgB5r+lOgpfmwOppSo+TCxU7lbs1f0aqhuOWCAQJ
	 nSp9qIjHXyhaM2ZWjImRcSgGFK+Qtd5m3SICc9kPe///gov44G5mo53yfrD0fL4T+d
	 ktkiejuRhmaNxii+tH/Fzt74bcxml9vena+omOIj5kzlbtWlDd1l/rfNbEVoEtvk/9
	 7pM6XMS867WIQ==
Message-ID: <251d19c0-f788-4291-a4b3-d6f8a9b3b4f1@asahilina.net>
Date: Sat, 2 Nov 2024 06:18:54 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Fix __wp_page_copy_user fallback path for remote mm
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sergio Lopez Pascual <slp@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 Jia He <justin.he@arm.com>, Yibo Cai <Yibo.Cai@arm.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <20241101-mm-remote-pfn-v1-1-080b609270b7@asahilina.net>
 <20241101120717.11db30a5abc6378da7910719@linux-foundation.org>
Content-Language: en-US
From: Asahi Lina <lina@asahilina.net>
In-Reply-To: <20241101120717.11db30a5abc6378da7910719@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/2/24 4:07 AM, Andrew Morton wrote:
> On Fri, 01 Nov 2024 21:08:02 +0900 Asahi Lina <lina@asahilina.net> wrote:
> 
>> If the source page is a PFN mapping, we copy back from userspace.
>> However, if this fault is a remote access, we cannot use
>> __copy_from_user_inatomic. Instead, use access_remote_vm() in this case.
>>
>> Fixes WARN and incorrect zero-filling when writing to CoW mappings in
>> a remote process, such as when using gdb on a binary present on a DAX
>> filesystem.
>>
>> [  143.683782] ------------[ cut here ]------------
>> [  143.683784] WARNING: CPU: 1 PID: 350 at mm/memory.c:2904 __wp_page_copy_user+0x120/0x2bc
>>
>> ...
>>
> 
> Thanks.  I assume we should backport this into earlier kernels?
> 
> If so, a Fixes: target is desired, to tell people how far back in time
> it should be ported.

I think so? I'm not sure how back the bug goes though, possibly a long
time...

> I think it's
> 
> 83d116c53058 ("mm: fix double page fault on arm64 if PTE_AF is cleared").

That doesn't sound right. The old code prior to the patch still had the
__copy_from_user_inatomic() fallback path so it should still have the
same problem. That fallback goes back to:

  6aab341e0a28 ("mm: re-architect the VM_UNPAGED logic")

But the ptrace code back then doesn't seem to be using that codepath at
all, so that's meaningless. I think this is the proper tag:

  3565fce3a659 ("mm, x86: get_user_pages() for dax mappings")

That's when GUP started working for DAX mappings at all, and if my
reading of the code is correct, at that point do_wp_page() was only
grabbing the struct page for normal pages to pass to wp_page_copy()
(triggering the fallback path for DAX mappings). The code has moved
around a lot today but has the same logic, so I think it's been broken
since then.

Should I resend it with the Fixes tag?

> 
> 
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -3081,13 +3081,18 @@ static inline int __wp_page_copy_user(struct page *dst, struct page *src,
>>  			update_mmu_cache_range(vmf, vma, addr, vmf->pte, 1);
>>  	}
>>  
>> +	/* If the mm is a remote mm, copy in the page using access_remote_vm() */
>> +	if (current->mm != mm) {
>> +		if (access_remote_vm(mm, (unsigned long)uaddr, kaddr, PAGE_SIZE, 0) != PAGE_SIZE)
>> +			goto warn;
>> +	}
>>  	/*
>>  	 * This really shouldn't fail, because the page is there
>>  	 * in the page tables. But it might just be unreadable,
>>  	 * in which case we just give up and fill the result with
>>  	 * zeroes.
>>  	 */
>> -	if (__copy_from_user_inatomic(kaddr, uaddr, PAGE_SIZE)) {
>> +	else if (__copy_from_user_inatomic(kaddr, uaddr, PAGE_SIZE)) {
>>  		if (vmf->pte)
>>  			goto warn;
>>  
> 
> The coding style ends up being unconventional.  I made these changes:
> 
> --- a/mm/memory.c~mm-fix-__wp_page_copy_user-fallback-path-for-remote-mm-fix
> +++ a/mm/memory.c
> @@ -3081,18 +3081,20 @@ static inline int __wp_page_copy_user(st
>  			update_mmu_cache_range(vmf, vma, addr, vmf->pte, 1);
>  	}
>  
> -	/* If the mm is a remote mm, copy in the page using access_remote_vm() */
> -	if (current->mm != mm) {
> -		if (access_remote_vm(mm, (unsigned long)uaddr, kaddr, PAGE_SIZE, 0) != PAGE_SIZE)
> -			goto warn;
> -	}
>  	/*
> -	 * This really shouldn't fail, because the page is there
> -	 * in the page tables. But it might just be unreadable,
> -	 * in which case we just give up and fill the result with
> -	 * zeroes.
> +	 * If the mm is a remote mm, copy in the page using access_remote_vm()
>  	 */
> -	else if (__copy_from_user_inatomic(kaddr, uaddr, PAGE_SIZE)) {
> +	if (current->mm != mm) {
> +		if (access_remote_vm(mm, (unsigned long)uaddr, kaddr,
> +				     PAGE_SIZE, 0) != PAGE_SIZE)
> +			goto warn;
> +	} else if (__copy_from_user_inatomic(kaddr, uaddr, PAGE_SIZE)) {
> +		/*
> +		 * This really shouldn't fail, because the page is there
> +		 * in the page tables. But it might just be unreadable,
> +		 * in which case we just give up and fill the result with
> +		 * zeroes.
> +		 */
>  		if (vmf->pte)
>  			goto warn;
>  
> _
> 
> I'll queue this for testing and shall await further review.
> 

~~ Lina


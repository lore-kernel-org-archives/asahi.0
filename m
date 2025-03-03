Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC692135BB
	for <asahi@lists.linux.dev>; Mon,  3 Mar 2025 15:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741016606; cv=none; b=JmPUW0reiYMZzyXqj5CH5knC7Q/ionlogUv9ALaW3tuSuwzFvMZfsDqSwwMyvuEK0XHgTEppD9YqAZONZl9P/goFysLxeobxx4ME08zYIj4bZ9GFjEQzJdIZqnhPAmCVykwlol+KxFtPxx2ZSQLWUL4CCs4yIq73KNP6CjbIOb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741016606; c=relaxed/simple;
	bh=GF4nkeF7KSiSXrWzXWnDBoMn1B2bg16Grh3w7rcsf8c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXZ3xPqHFAkg5IHEqspapau5ZujTj22qRq+UU0bdFVYBS9jhk9PHZMEZ/xSQtMIXzuFLK9xweaTcjkH2bWo7wh/iRPUI/FXTrl1Sz5N2FpuFlBKJ6FSSPwMrsR/26UkcW5a25jmXOWNizt72GAoV2iv3XqvJtInZa7E0N9Hkehw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=C9b4AFVy; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="C9b4AFVy"
Date: Mon, 3 Mar 2025 10:43:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1741016601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=seEoy9RCdjq5gQ6u5K7vAkwJraDrjevBUwdT9habU9w=;
	b=C9b4AFVy0sa2gaLc+VViC/urt5RncL82pVN2bUddo2Pm6GmNm4k4zSL16v11jS8d/6fOC7
	g55aOKjHpoR8yR0NKmwOybhsR48aj94GXLU7qzRoiwMK2sRNdHhvG5AxAsOB9yX0vCrgvo
	e6M4l0C4OSF4zy1I47k/DZExaosFGhcgJs43l5o0fPCsxL7yhdL5uTb/6jLYAwgvbJXJew
	Mok98SgC+aDRdCTh39oIFM7AvwQAw18oXitpelTLxByxDJ87KXkDjzb9MuC45ZFOTFuPF8
	NwBh2rSERnx4gzBOMcaQVwU4BCpP4mAwgED3X/seOjMbPaQOMSje6997bOz3KQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH] MAINTAINERS: Add myself (Neal Gompa) as a reviewer for
 ARM Apple support
Message-ID: <Z8XOFTclPeZwBKld@blossom>
References: <20250303154012.1417088-1-neal@gompa.dev>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250303154012.1417088-1-neal@gompa.dev>
X-Migadu-Flow: FLOW_OUT

Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>

Le Mon , Mar 03, 2025 at 10:40:10AM -0500, Neal Gompa a écrit :
> As a member of the Asahi Linux project, I (Neal) have been involved in
> reviewing the patches downstream as part of enabling the Fedora Asahi Remix
> distribution for years and have recently been reviewing patches for upstream
> submission as well.
> 
> This formalizes my role as a reviewer for ARM Apple system support patches.
> 
> Signed-off-by: Neal Gompa <neal@gompa.dev>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8e0736dc2ee0..052e6e997817 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2212,6 +2212,7 @@ ARM/APPLE MACHINE SUPPORT
>  M:	Sven Peter <sven@svenpeter.dev>
>  M:	Janne Grunau <j@jannau.net>
>  R:	Alyssa Rosenzweig <alyssa@rosenzweig.io>
> +R:	Neal Gompa <neal@gompa.dev>
>  L:	asahi@lists.linux.dev
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -- 
> 2.48.1
> 

Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32979371D1E
	for <asahi@lists.linux.dev>; Sat, 10 Oct 2026 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791646382; cv=none; b=BFOKrR2vpy9oEsNUMV28QEcjNroh0r+HnosrrpQeXliHv9+zCuHizkwNpTO8WAyvgQ2v5lFckqOGXFS7KgaUrQPKztRLhadXm0JVcVtfU3nJYK6U+V69u62fmKpZnJNx0/VuOvfWWHz+p+04l/2C2Hk2V215bTfHuXhnwg9nfrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791646382; c=relaxed/simple;
	bh=FXpEy64Hs7j02VgYSNGnbtxwT+vTHn2e3VaJSTtiZVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fvuvn2ckgM2zseyArkq7GtYaK5yowyoxqKVqnkkZQHTlFY1BuPuWxQfi4CugpA4S+KXjlz1SyQMnVV0so/DlZvd18+rBTlIAQnQaf9QCz7OsabqVnpsVUs8fXMtxKwJYndOuiRw9SgwehBYN34eNoXw5ufbWow+2QwRaEOVtOg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=IfUyWZ1Q; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="IfUyWZ1Q"
Message-ID: <d20b21b9-52d6-4eaf-99a2-ce140deeb9b4@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791646371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=asahtIKCZ2A5uzV6zinqC8Uo/bJvj2RF/iD4evG15+g=;
	b=IfUyWZ1QCLDuQwPd/yOWQQtO/I1WU50GMXDYBUD/y2JGmUJDUTlN+oBI4pad53qJc7ngMF
	43tmcWMxHKAV8rz5j3HAD7VPkVj/JCaFTBnRyNRSbETGjM7YS73zaGSss/PSDgZgjGHbCv
	+BVoNnjnrOyNybVJCz+AY3YKDWKcH/U=
Date: Sat, 10 Oct 2026 17:32:48 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] doc: apple: Add Apple M3 as supported SoC
To: Janne Grunau <j@jannau.net>, u-boot@lists.u-boot-project.org
Cc: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Simon Glass <sjg@chromium.org>, asahi@lists.linux.dev,
 Anshul Dalal <anshuld@ti.com>
References: <20261010-apple-t603x-support-v1-0-ca529f301a62@jannau.net>
 <20261010-apple-t603x-support-v1-1-ca529f301a62@jannau.net>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <20261010-apple-t603x-support-v1-1-ca529f301a62@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/26 14:13, Janne Grunau wrote:
> Adding M3 (t8122) to the documentation was missed in commit a1a47eee6763
> ("arm: apple: Add Apple M3 (t8122) support").
> Since Apple silicon SoCs have switched to upstream DTS stop listing SoCs
> with device trees. The expectation is that u-boot support is added
> together with Linux support. So the device trees might lag a little
> behind. Since u-boot's dtbs are usually not used on Apple SoCs this is
> not an issue.
>
> Fixes: a1a47eee6763 ("arm: apple: Add Apple M3 (t8122) support")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>   doc/board/apple/m1.rst | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/doc/board/apple/m1.rst b/doc/board/apple/m1.rst
> index 900c5e6d91ea..4ed275f7ea8c 100644
> --- a/doc/board/apple/m1.rst
> +++ b/doc/board/apple/m1.rst
> @@ -9,6 +9,7 @@ the following SoCs work:
>   
>    - Apple M1 SoC (t8103)
>    - Apple M2 SoC (t8112)
> + - Apple M3 SoC (t8112)
Typo? This should be t8122.
>    - Apple M1 Pro SoC (t6000)
>    - Apple M1 Max SoC (t6001)
>    - Apple M1 Ultra SoC (t6002)
> @@ -24,8 +25,8 @@ On these SoCs the following hardware is supported:
>    - NVMe storage
>    - USB 3.1 Type-C ports
>   
> -Device trees are provided in dts/upstream/src/arm64/apple/ and available
> -for all M1 and M2 (t8103, t8112, t600x and t602x) devices.
> +Device trees are provided in dts/upstream/src/arm64/apple/ and available once
> +they are merged in the Linux kernel tree.
>   
>   Building U-Boot
>   ---------------
> @@ -82,5 +83,7 @@ supported SoCs.
>        - Base Address
>      * - M1 (t8103) and M2 (t8112)
>        - 0x235200000
> +   * - M3 (t8122)
> +     - 0x2a1200000
>      * - M1 Pro/Max/Ultra (t6000/t6001/t6002) and M2 Pro/Max/Ultra (t6020/t6021/t6022)
>        - 0x39b200000

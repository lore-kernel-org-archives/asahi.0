Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988203A4267
	for <asahi@lists.linux.dev>; Sun, 19 Jul 2026 15:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784473451; cv=none; b=pfDwnlsdJC4pPdMK/TlWGh/RuXQBszZA9xI2VNUehEUnf8iadkotUbVuXeuIYiV4dM2WXX6Vn1xokqkWaGHsauKaFn9rZcOjY1ms68C7+UyQb/lX8aNP9bRYP99LQdMg/suFdkme+hFKm6vXFQ3SnEYTS16IGZKCw3o2K0irlQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784473451; c=relaxed/simple;
	bh=l5D/QQEeLYIeXaEs+i2n+UTW/nJVFOmjamxH4yZ6ftM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kM6koklWMwA3xClDLTorz+sG+7LF4xPtIBokDRdMy8gozYziizAM9B6QaNHzf2fooxGWbVoyPzTXtSoLgmLev848rfxd5RTCJGa3uzATcq/8wPj/PCLzIIwuhl6m4xdtE9AKE3aNjqMfvkRBJoQbjbBlyjPDFfucQrO0lARrzzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=h5TdnQqK; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="h5TdnQqK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1784473443;
 bh=VAtcnOfqiiOyUAHauK6NUyg4WFqcLnTDUNxtGWK9Lr4=;
 b=h5TdnQqK4bDZFK5NtKHVrIOA25TAVpCHyhqUBb1eZ40tN/1/K4AGdv0B4wcGKugGcDLoL7GGE
 rbf6urNSBo3SoH6oqikoVk+QXwoWPBLdvopxylYJR+YK4ux96DYCgr1XhRoPmbe1ecDv3U+mUUh
 1TDi4QRWEKCPi7qHuBv4P+XJpo34iIZGuuEFwyyUAzyg/cIyBZxoQZ45vpWGCet1VBAQ8AMOb5k
 HNOlEOuvhYuCRSrQU0fNHJquCYxqPyW/oMa3ca70hrBqMlB2JPHG3cjNLEZQWtRyLB081pDcS4s
 DHmYdeQyapANLYyAo2nR/tCE76Yulq/Wvc3cGVaqZhEg==
X-Forward-Email-ID: 6a5ce717e6d4cb6492a15b36
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.11.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Sun, 19 Jul 2026 11:02:45 -0400
Message-Id: <DK2N0ITFL309.1Y5VHF18YIQ7M@ubuntu.com>
Cc: <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "kernel test robot" <lkp@intel.com>
Subject: Re: [PATCH] mfd: macsmc: Fix key count endianness annotation
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sven Peter" <sven@kernel.org>, "Janne Grunau" <j@jannau.net>, "Neal
 Gompa" <neal@gompa.dev>, "Lee Jones" <lee@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260719-b4-macsmc-be32-fix-v1-1-c7b1936307fa@kernel.org>
In-Reply-To: <20260719-b4-macsmc-be32-fix-v1-1-c7b1936307fa@kernel.org>

On Sun Jul 19, 2026 at 9:00 AM EDT, Sven Peter wrote:
> SMC firmware returns the value of the #KEY key in big-endian unlike most
> other keys. Reading it through apple_smc_read_u32() into a plain u32
> and then converting with be32_to_cpu() makes sparse complain:
>
>   drivers/mfd/macsmc.c:462:26: sparse: cast to restricted __be32
>
> Read the raw value into a __be32 using apple_smc_read() instead.
>
> Fixes: e038d985c982 ("mfd: Add Apple Silicon System Management Controller=
")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202607181046.OANjIoqR-lkp@i=
ntel.com/
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  drivers/mfd/macsmc.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
> index 358feec2d088..514cba7dc897 100644
> --- a/drivers/mfd/macsmc.c
> +++ b/drivers/mfd/macsmc.c
> @@ -410,7 +410,7 @@ static int apple_smc_probe(struct platform_device *pd=
ev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct apple_smc *smc;
> -	u32 count;
> +	__be32 count;
>  	int ret;
> =20
>  	smc =3D devm_kzalloc(dev, sizeof(*smc), GFP_KERNEL);
> @@ -461,8 +461,10 @@ static int apple_smc_probe(struct platform_device *p=
dev)
>  	dev_set_drvdata(&pdev->dev, smc);
>  	BLOCKING_INIT_NOTIFIER_HEAD(&smc->event_handlers);
> =20
> -	ret =3D apple_smc_read_u32(smc, SMC_KEY(#KEY), &count);
> -	if (ret)
> +	ret =3D apple_smc_read(smc, SMC_KEY(#KEY), &count, sizeof(count));
> +	if (ret >=3D 0 && ret !=3D sizeof(count))
> +		ret =3D -EINVAL;
> +	if (ret < 0)
>  		return dev_err_probe(smc->dev, ret, "Failed to get key count");
>  	smc->key_count =3D be32_to_cpu(count);

This makes sense, it just feels weird reading because u32 is.. not a
be32 (that gets passed into be32_to_cpu).

I guess it doesn't really matter.

-Josh

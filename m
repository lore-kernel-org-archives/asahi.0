Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B2E43CEC7
	for <asahi@lists.linux.dev>; Tue, 16 Jun 2026 11:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781611109; cv=none; b=KoCBWxgOXGrITkSc22CDUUIb3BY0I6olBVfz++hXzPRgBS2xVeRgFrI8weLXCQ0j7y/JIIZuIAhvTtvChNQOepjQnxw1d140Kw+GsbPZHYI4Ij7K/M3Vp/jM35lRyU0QJFEn60xinXpNt7H6+gDCbqfF9/lHIaAadN5iPk8Vs/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781611109; c=relaxed/simple;
	bh=NeBzqMjllLmJPQKCg2CydkYngZ+W6T/VDYdovNqLGzA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=YjXRaN1dNd0z+s8Kdw6psT4gPkMcLgvb1o5+L3zbRHb00AHFMKDaivVUrDjBAOKVoTkzzQG3qEhnLE78CN0//2485LMl4wCMP0ZfFAX3AXGZYIDK09kNiaeVRBWH/cAik3t2a3duzUlOQGWuZpY5+KwAZrauKAcJSSH7QAw+kMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=DH+W0Z8G; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="DH+W0Z8G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1781611106;
 bh=HmsrwhwGIBGtR6IR/FUQcccER/dBuB3LGdWTVHkvHFU=;
 b=DH+W0Z8GyuNTN/xbobdf2pbIYok1TDU1ClgKhvrEO49p0OyG0tsfXXDL+mNTnlR8H4hh1cJXz
 CZ00pKSLg2a6rwUbxjZ5qbo9d9UbKCqJ2zq1XjOBsTyuOvs8d9E0RAGmH6tzHeD7L/X/E0AuTDf
 4t+3JUJHLy3Dy2IZStIVrVkMaF7scCiTsBDRclHL22rE0tOR/LabM75wqoj2/WUmCff0Z+BWhqK
 CQKE21ZTI1V1HF6C8BWzSdDAJaNf3RhVx4pcYXxqhL1h/wN0Z54bSIDpa4HavezWAemgXmh3oFB
 y4yX/8fz+kjAnt7BtSQ3XvmpGaI6VBVPFzkwif06qESw==
X-Forward-Email-ID: 6a313a60428e66688ae5d278
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.28
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
Date: Tue, 16 Jun 2026 07:58:23 -0400
Message-Id: <DJAGFE0RORK0.2HXY05SU7H3AF@ubuntu.com>
Subject: Re: [PATCH] soc: apple: sart: require device link for consumers
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>, "Sven Peter" <sven@kernel.org>,
 "Janne Grunau" <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>,
 <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260616005346.7862-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260616005346.7862-1-pengpeng@iscas.ac.cn>

On Mon Jun 15, 2026 at 8:53 PM EDT, Pengpeng Hou wrote:
> devm_apple_sart_get() obtains the supplier platform device and attempts
> to create a runtime-PM device link to it, but it ignores device_link_add(=
)
> failure.  A consumer can then continue without the dependency that keeps
> the SART supplier ordered and runtime-PM reachable.
>
> Treat a failed device link as an error and drop the supplier device
> reference before returning.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/soc/apple/sart.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/apple/sart.c b/drivers/soc/apple/sart.c
> index 9eaf3febb382..66b99955b395 100644
> --- a/drivers/soc/apple/sart.c
> +++ b/drivers/soc/apple/sart.c
> @@ -218,6 +218,7 @@ struct apple_sart *devm_apple_sart_get(struct device =
*dev)
>  {
>  	struct device_node *sart_node;
>  	struct platform_device *sart_pdev;
> +	struct device_link *link;
>  	struct apple_sart *sart;
> =20
>  	sart_node =3D of_parse_phandle(dev->of_node, "apple,sart", 0);
> @@ -236,8 +237,12 @@ struct apple_sart *devm_apple_sart_get(struct device=
 *dev)
>  		return ERR_PTR(-EPROBE_DEFER);
>  	}
> =20
> -	device_link_add(dev, &sart_pdev->dev,
> -			DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER);
> +	link =3D device_link_add(dev, &sart_pdev->dev,
> +			       DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_SUPPLIER);
> +	if (!link) {
> +		put_device(&sart_pdev->dev);
> +		return ERR_PTR(-ENODEV);
> +	}
> =20
>  	put_device(&sart_pdev->dev);
> =20

I *think* this is okay...

Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>

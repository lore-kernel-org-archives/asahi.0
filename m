Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690AD1F16B
	for <asahi@lists.linux.dev>; Sun,  9 Aug 2026 14:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786285868; cv=none; b=FgcyOhmYDhUFhVDIJlYgXIg6zk/MkHwVc9YeeWibTAs51X1tvEYxjNP/fB90hlG1E08q58OnWsHSEW7ZKgxZiSDPOSDfv5vZghP7dSC2FSM0g3oWAvYHydlLLRZGJC+0m7F5KwFyoswHXly8lxKpGvKyOTZc+HyNkOv1TZ+rgSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786285868; c=relaxed/simple;
	bh=hpkdnaKNFHBwuw0Q71KEfjOzckx55NGQYX0XgHyeCPs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qNipZ3KSux2t3ZbSESTevn1y71j6Uk03VCvYEbI7roDiPSXJfYLUq9FbjqghLQ25mSqBRYEdjAbG0exnd8dq62r4p14NFuu/vHb18A2YbOGvg7WzedT0/fy5ey7Gs7vVbqgdQKUsO0a9CZCHcxXhdzZzPeU/zaiGDJeMIAoYHEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=nvFBQUaY; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="nvFBQUaY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1786285860;
 bh=FikuqY3b2pZlaNCLUbHPKWMhWQP0Tun7aZ9UkowPV+8=;
 b=nvFBQUaYoKRqVMUXq8KSb5yhOdFu1DLx0yQPsdMhW3CcZakHtQ03CRmDNG8DJ8kcwHjQbNmRf
 0tQKz/pAFjw/qzQ+VewztyaGo53foVWPxoE8fzFDfwsGiJeYsxtUfORNJTi//EKKKK4k+pn6Qp/
 KMgAcsUgoZiUtO66F3Jm+s9qaOgljEWm+H9tv2trIrLT+mVWJhsyzPNMU3n3JcwIAnUeFspkWvY
 dsiu/0K/33sVDIhjCO6w0JxhGVPDsWcl/16Hnquz8aX7ZlA5DSPP3gbJnjptb/2e5dkeShs/qGo
 ArBmDDYLJdB25pVu6n9b6lQ/qn/x8SSHpGxgyiSwiqEg==
X-Forward-Email-ID: 6a788f1b2fa0fb6ccea01ae2
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.13.10
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
Date: Sun, 09 Aug 2026 10:30:49 -0400
Message-Id: <DKKHHITWR3F4.390HXQFLQR8X5@ubuntu.com>
Cc: <asahi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] reset: Add Apple SoC CIO reset driver
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "Sven Peter" <sven@kernel.org>, "Janne Grunau" <j@jannau.net>, "Neal
 Gompa" <neal@gompa.dev>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>
X-Mailer: aerc 0.21.0
References: <20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org>
 <20260809-b4-cio-reset-v1-2-4f33777d9b4b@kernel.org>
In-Reply-To: <20260809-b4-cio-reset-v1-2-4f33777d9b4b@kernel.org>

On Sun Aug 9, 2026 at 8:16 AM EDT, Sven Peter wrote:
> Add a driver for the reset of the CIO (USB4/Thunderbolt) blocks on
> Apple Silicon SoCs which has to be deasserted before their
> co-processor can be booted. On t8103 each port comes with a dedicated
> register page while t600x uses a single register with one request bit
> per port shared by all ports of a die inside the PMGR MMIO region.
>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  MAINTAINERS                     |   1 +
>  drivers/reset/Kconfig           |  10 +++
>  drivers/reset/Makefile          |   1 +
>  drivers/reset/reset-apple-cio.c | 182 ++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 194 insertions(+)

> +
> +static int apple_cio_reset_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct apple_cio_reset *priv;
> +	int ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->variant =3D of_device_get_match_data(dev);

Might be a dumb question, but does priv->variant also need to be
checked? Because later priv->variant->pmgr_child is and I *think*
it could return NULL.

(Or is this not necessary since in theory the device should only run
this if detected... so this should never be an issue?)

> +
> +	ret =3D devm_mutex_init(dev, &priv->lock);
> +	if (ret)
> +		return ret;
> +
> +	if (priv->variant->pmgr_child) {
> +		priv->regmap =3D syscon_node_to_regmap(dev->of_node->parent);
> +		if (IS_ERR(priv->regmap))
> +			return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +					     "Failed to get parent regmap");
> +
> +		ret =3D of_property_read_u32(dev->of_node, "reg", &priv->offset);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to read reg offset");
> +	} else {
> +		void __iomem *base;
> +
> +		base =3D devm_platform_ioremap_resource(pdev, 0);
> +		if (IS_ERR(base))
> +			return PTR_ERR(base);
> +
> +		priv->regmap =3D devm_regmap_init_mmio(dev, base,
> +						     &apple_cio_reset_regmap_config);
> +		if (IS_ERR(priv->regmap))
> +			return dev_err_probe(dev, PTR_ERR(priv->regmap),
> +					     "Failed to init MMIO regmap");
> +	}
> +
> +	priv->rcdev.owner =3D THIS_MODULE;
> +	priv->rcdev.ops =3D &apple_cio_reset_ops;
> +	priv->rcdev.of_node =3D dev->of_node;
> +	priv->rcdev.nr_resets =3D priv->variant->nr_resets;
> +
> +	return devm_reset_controller_register(dev, &priv->rcdev);
> +}
> +
> +static const struct of_device_id apple_cio_reset_match[] =3D {
> +	{
> +		.compatible =3D "apple,t8103-cio-reset",
> +		.data =3D &apple_t8103_cio_reset,
> +	},
> +	{
> +		.compatible =3D "apple,t6000-cio-reset",
> +		.data =3D &apple_t6000_cio_reset,
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, apple_cio_reset_match);
> +
> +static struct platform_driver apple_cio_reset_driver =3D {
> +	.driver =3D {
> +		.name =3D "apple-cio-reset",
> +		.of_match_table =3D apple_cio_reset_match,
> +	},
> +	.probe =3D apple_cio_reset_probe,
> +};
> +module_platform_driver(apple_cio_reset_driver);
> +
> +MODULE_AUTHOR("Sven Peter <sven@kernel.org>");
> +MODULE_DESCRIPTION("Apple SoC CIO block reset driver");
> +MODULE_LICENSE("Dual MIT/GPL");


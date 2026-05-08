Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A08C3A256C
	for <asahi@lists.linux.dev>; Fri,  8 May 2026 23:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778281598; cv=none; b=haJMO5aVxD9BCv0YCNvtSsYPfqS8Zgohk462zjYzTyytAWP1Guh6kF5PgpTkpIZLlRp/YFD2H1Bkti35Fg9rEyYWwOwVrT3YF/GroGr67fT1kBGOP/ANvZEwcNJL/Z2OQmjkk3PBUfXUOwd+epmbPNo8hM7ilRYfoL2Bv1aK21U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778281598; c=relaxed/simple;
	bh=t85JgM7KjwXDhuHHWszBT9YbwgD4puLOXW4SOvK3YkE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DlsOB8Lc/p2YigOKLfQz4iXUJPOH9Vlem2cj4dMX1giq4q6S1+JY2XM11XDG/Tt5RAylg7H1i/ydv1lBNQ9eCtSNxdv/MrEvwMqdqXNzT7jJ4cLN+5gmKr9GNVA6SskjtflMGj1dKAk9UBGcIgENNxj/k/W3PQdjcTdfmOnSCd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=dnhJgd3b; arc=none smtp.client-ip=121.127.44.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="dnhJgd3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1778281596;
 bh=q2RkdA8XgRewXeIJWKjEFH8X9QpIWC1TGFtAoUA+NC0=;
 b=dnhJgd3bj5vKoS98ZpwuBbJDZSg8VBVJl2aSZMoKtG6AcAmsq/kyja/uFeImpEdhAv+0I4rI4
 td08ilsiUkIqgJInw4cHQeOHmJouRRqQgkgk4Bub/oEQMahofIZp9gjhLLYRJVd6LOC5ey2x0rj
 qZCO3OmwII0TOTO/o2eAbWCEwZwi09xitZQgsL+magDoRU3sGOs1DYJBGS2ZA0njzWrC55aTwoZ
 8Sftx8Wp/rWdUOY8KLDNaspGgLclIz5bKT+UF3u7WND+sWuO5ZuPswpDIdhivNRbDPsKYS82RNV
 hazGfaUfDpX/QYLrV0Pc9a2Bz72pzLAh5E+iOAXBDKOA==
X-Forward-Email-ID: 69fe6c7947f0cc71ba90f8e4
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.7.7
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
Date: Fri, 08 May 2026 19:06:31 -0400
Message-Id: <DIDO7P6WFHGO.MP8TEJ5N4QQP@ubuntu.com>
Cc: <olteanv@gmail.com>, <asahi@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] phy: apple: atc: Fix typec switch/mux leak on unbind
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "David Carlier" <devnexen@gmail.com>, <sven@kernel.org>, <j@jannau.net>,
 <neal@gompa.dev>, <vkoul@kernel.org>, <neil.armstrong@linaro.org>,
 <marcan@marcan.st>, <p.zabel@pengutronix.de>
X-Mailer: aerc 0.21.0
References: <20260507163746.108086-1-devnexen@gmail.com>
 <20260508201958.30060-1-devnexen@gmail.com>
In-Reply-To: <20260508201958.30060-1-devnexen@gmail.com>

On Fri May 8, 2026 at 4:19 PM EDT, David Carlier wrote:
>  drivers/phy/apple/atc.c | 27 ++++++++++++++++++++++-----
>  1 file changed, 22 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> index e9d106f135c5..4156fabad742 100644
> --- a/drivers/phy/apple/atc.c
> +++ b/drivers/phy/apple/atc.c
> @@ -628,9 +628,6 @@ struct apple_atcphy {
> =20
>  	struct reset_controller_dev rcdev;
> =20
> -	struct typec_switch *sw;
> -	struct typec_mux *mux;
> -
>  	struct mutex lock;
>  };
> =20
> @@ -2066,15 +2063,25 @@ static int atcphy_sw_set(struct typec_switch_dev =
*sw, enum typec_orientation ori
>  	return 0;
>  }
> =20
> +static void atcphy_typec_switch_unregister(void *data)
> +{
> +	typec_switch_unregister(data);
> +}
> +
>  static int atcphy_probe_switch(struct apple_atcphy *atcphy)
>  {
> +	struct typec_switch_dev *sw;
>  	struct typec_switch_desc sw_desc =3D {
>  		.drvdata =3D atcphy,
>  		.fwnode =3D atcphy->dev->fwnode,
>  		.set =3D atcphy_sw_set,
>  	};
> =20
> -	return PTR_ERR_OR_ZERO(typec_switch_register(atcphy->dev, &sw_desc));
> +	sw =3D typec_switch_register(atcphy->dev, &sw_desc);
> +	if (IS_ERR(sw))
> +		return PTR_ERR(sw);
> +
> +	return devm_add_action_or_reset(atcphy->dev, atcphy_typec_switch_unregi=
ster, sw);
>  }
> =20
>  static int atcphy_mux_set(struct typec_mux_dev *mux, struct typec_mux_st=
ate *state)
> @@ -2146,15 +2153,25 @@ static int atcphy_mux_set(struct typec_mux_dev *m=
ux, struct typec_mux_state *sta
>  	return atcphy_configure(atcphy, target_mode);
>  }
> =20
> +static void atcphy_typec_mux_unregister(void *data)
> +{
> +	typec_mux_unregister(data);
> +}
> +
>  static int atcphy_probe_mux(struct apple_atcphy *atcphy)
>  {
> +	struct typec_mux_dev *mux;
>  	struct typec_mux_desc mux_desc =3D {
>  		.drvdata =3D atcphy,
>  		.fwnode =3D atcphy->dev->fwnode,
>  		.set =3D atcphy_mux_set,
>  	};
> =20
> -	return PTR_ERR_OR_ZERO(typec_mux_register(atcphy->dev, &mux_desc));
> +	mux =3D typec_mux_register(atcphy->dev, &mux_desc);
> +	if (IS_ERR(mux))
> +		return PTR_ERR(mux);
> +
> +	return devm_add_action_or_reset(atcphy->dev, atcphy_typec_mux_unregiste=
r, mux);
>  }
> =20
>  static int atcphy_load_tunables(struct apple_atcphy *atcphy)

Looks okay. Ran it on M1 MBP, no issues as far as I can tell.

Tested-by: Joshua Peisach <jpeisach@ubuntu.com>

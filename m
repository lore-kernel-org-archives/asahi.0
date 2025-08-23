Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DEF4317D
	for <asahi@lists.linux.dev>; Sat, 23 Aug 2025 03:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755920010; cv=none; b=IgqoH4FDmIQOeGEDhw4Wq2Kj9sGnU6Pk20TrVwHAhve4cuwDkfLDQC1vFMOPRr0NuAgqv5DYvPsyUJttudeWTc229W3uHwS6F6FvxLbbNL6gtNUUdtVB3XTAUn+eNzYxQTsRLEn4GTEToqw17Dv1feI9R5c1QLfvlS/aJqozDLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755920010; c=relaxed/simple;
	bh=22aqXHfJ0gDrVnDDeKPXsb5+lMYTML3pkSNh2zWaRXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pxrh8eJwty8Vjp0C8wYSJ97xN7x4KhCX/6rUojS0GPoEMqwO+HPnoTLKB2xREJu8kHdXUkYR43wLqj+oyEsdYikZFiYcpTeJGUxiZ0IWOymMIfIPjtMpevdWKg1nVO8lXP0VvTKUITk4UMBwCtfUFeGE+lWkRXMscaZL9ahGMPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhVahXh9; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhVahXh9"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b47475cf8ecso1961935a12.0
        for <asahi@lists.linux.dev>; Fri, 22 Aug 2025 20:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755920008; x=1756524808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QqumeEmO4Hx86KLVWkSoquZafUAkAj4dwVn2wF9Dw9U=;
        b=IhVahXh9BC7hnerhkzT8PxHrhCw1VF3xW9J7aLY5+fHw5o5uad6cCgPtDeDKh/+E1U
         iaEnB5j3afeEoSIs74FqpdbFvIlrWtBFjLSU7VSeFqcnNQQmJO1EC4MxrbOZ6WfVG2+w
         7A1fcJSASKxr1z7cQ4fivE8hbnDCJixkVmlSK1gRyr59vRvA6UU7E0TUf077ajHpyemg
         ljQvxASMPm6ywBgXDv7ztB8v4bGfgST5sA7p+DPN8zDk5WpzmsCJzaaI3A/GRBlhkvOx
         U15CtOL5WbOFREmH9V3wf3aoO4I5+zRhS4SWtEQ5uwQCQC4n/WLHNGiagvEDM92Rw/Xh
         NRJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755920008; x=1756524808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QqumeEmO4Hx86KLVWkSoquZafUAkAj4dwVn2wF9Dw9U=;
        b=BiJ5xNthUw2nMIc/A0h9j0Z23s8Vq4XUM7lKMcDUdVczaiLe4GM9Cb5M0tZTsd8iCy
         dnGb9U+az3RJHCN7gBFTo2CBLZP1UFcQh6rcBDKqwEcRGpwKo8r87pIU3Cu1mnoZgPFT
         zIMLZLhT1NaedboY8EhyPBLpsd+XrE3LSOuWhW149n+jplbuVhREGwKh+zKE1NAGHUSp
         EptBGJjNaVkVlS7bT4c6jZ7dON+6Ni1H7U7Ys+8VoidInhVOij30qGP7F0FGwxFg0BKl
         MbHBDzgxpiDxT9NbHdAAIyDtBqDqcVLPzbEnacip4VnYCbeWOErMlSLDHAGXrLUveck9
         lTdg==
X-Gm-Message-State: AOJu0YzIVLJDnBKi6BmvH3kbK7rM0ZjzUA7kgq47q6Dx4nuRHm9mrJhC
	NBsGNo7d+E+Sp4TGHFIWMqQyAMHsXuq3K2vuNms4E6whqCJSd61cQ2WK
X-Gm-Gg: ASbGncvZQAihvpZ3ikMD6tLe8StO3uW5rIow96Glh0OudTMvg8wiTqfoocCXDXC52QX
	Q0X9RsnM7XRt+J3JidMSPFXCEKPhPjVoyRhIRquI+SKagRJeS6p49u6uqgUhX3nmoEH2qFcM2jt
	a9tp42QrWnqh4wZaTnIPBI0bIYjjHgbh+rrZfIJ2oLT3CGb+F4SK0IANvXcX4m1H76Ave7CeC4H
	YPyNU1UdVwGoLNt5p/mFrWkWtXBPrIHZC/FzmxRHLeTXLzEDl98xfCKeti19UYhcjS1vQao8G6F
	KdPhT0q79hIH8as0l+KJhPQIbXdXY33hVCcAtMJYH9CeEy4rLnD6mnaqF/pPb9tmQsJm6H7ebRs
	src+sxHSLGOFAjefE5yd+qktgLfhR/rdsfcM/nsdpn1ATdU3HaaM8spn0c06FXFArOs3lPSw0c0
	ohmf9u3reHjArZ418kXeBF
X-Google-Smtp-Source: AGHT+IFNO6qfKHbLRi+OpQWp6841qH14Emm/wJaX729M23KqjGDOidxlZhEBKjGLIE2PeRR5ofMyBw==
X-Received: by 2002:a17:903:320d:b0:242:a3fc:5917 with SMTP id d9443c01a7336-2462ede290dmr67089965ad.2.1755920008250;
        Fri, 22 Aug 2025 20:33:28 -0700 (PDT)
Received: from setsuna.localnet (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466887fc80sm10166575ad.124.2025.08.22.20.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 20:33:27 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jean Delvare <jdelvare@suse.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-input@vger.kernel.org
Subject: Re: [PATCH 4/8] hwmon: Add Apple Silicon SMC hwmon driver
Date: Sat, 23 Aug 2025 13:33:20 +1000
Message-ID: <5792171.kQq0lBPeGt@setsuna>
In-Reply-To: <56e1f496-a4c7-46a5-bd74-0412c1fd7207@roeck-us.net>
References:
 <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
 <20250819-macsmc-subdevs-v1-4-57df6c3e5f19@gmail.com>
 <56e1f496-a4c7-46a5-bd74-0412c1fd7207@roeck-us.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Guenter,

On Wednesday, 20 August 2025 2:02:58=E2=80=AFam Australian Eastern Standard=
 Time Guenter Roeck wrote:
> On 8/19/25 04:47, James Calligeros wrote:
> > +/*
> > + * Many sensors report their data as IEEE-754 floats. No other SMC
> > function uses + * them.
> > + */
> > +static int macsmc_hwmon_read_f32_scaled(struct apple_smc *smc, smc_key
> > key, +					int *p, int scale)
> > +{
> > +	u32 fval;
> > +	u64 val;
> > +	int ret, exp;
> > +
> > +	ret =3D apple_smc_read_u32(smc, key, &fval);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	val =3D ((u64)((fval & FLT_MANT_MASK) | BIT(23)));
> > +	exp =3D ((fval >> 23) & 0xff) - FLT_EXP_BIAS - FLT_MANT_BIAS;
> > +	if (scale < 0) {
> > +		val <<=3D 32;
> > +		exp -=3D 32;
> > +		val /=3D -scale;
>=20
> I am quiter sure that this doesn't compile on 32 bit builds.
>=20
I don't see why not. We're not doing any 64-bit math on pointers, so we sho=
uld
be safe here. Regardless, this driver depends on MFD_MACSMC, which depends =
on
ARCH_APPLE, which is an ARM64 platform, so this driver shouldn't be compiled
during a 32-bit build anyway.


> > +
> > +	ret =3D of_property_read_string(fan_node, "apple,key-id", &now);
> > +	if (ret) {
> > +		dev_err(dev, "apple,key-id not found in fan node!");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret =3D macsmc_hwmon_parse_key(dev, smc, &fan->now, now);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (!of_property_read_string(fan_node, "label", &label))
> > +		strscpy_pad(fan->label, label, sizeof(fan->label));
> > +	else
> > +		strscpy_pad(fan->label, now, sizeof(fan->label));
> > +
> > +	fan->attrs =3D HWMON_F_LABEL | HWMON_F_INPUT;
> > +
> > +	ret =3D of_property_read_string(fan_node, "apple,fan-minimum", &min);
> > +	if (ret)
> > +		dev_warn(dev, "No minimum fan speed key for %s", fan->label);
> > +	else {
> > +		if (!macsmc_hwmon_parse_key(dev, smc, &fan->min, min))
> > +			fan->attrs |=3D HWMON_F_MIN;
>=20
> Above the error from macsmc_hwmon_parse_key() results in an abort,
> here the error is logged in the function and ignored.
>=20
> Either it is an error or it isn't. Ignoring errors is not acceptable.
> Dumping error messages and ignoring the error is even less acceptable.
>=20
The only strictly required key for fan speed monitoring is apple,key-id,
which is why it is the only one that causes an early return when parsing
it fails. If we don't have keys in the DT for min, max, target and mode,
then all that means is we can't enable manual fan speed control. I don't
see how making a failure to read these keys non-blocking is unacceptable
in this context. If this is about the dev_err print in parse_key, then
I can just get rid of that and have the parse_key callers do it when it's
actually a blocking error.

Regards,
James







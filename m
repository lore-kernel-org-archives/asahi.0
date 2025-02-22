Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C6F5383
	for <asahi@lists.linux.dev>; Sat, 22 Feb 2025 00:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740183429; cv=none; b=UpW+kpk2A9uhJCId5Db5INwsO47F2eqkMmijfP5M4NBMtJyhrB2pvhacYJqHdQYkKoiAIEBboRIpVzizh8cguoEbqrHl4ILUOxclEylbtOqCGYPrBwEFf3OHGWfq5m+Cy5Q6Fc6SUToXMI6jOdakmOWHr7i+nD/1u9njXtan2dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740183429; c=relaxed/simple;
	bh=qr85W/PiRzoYKCP0ImmABGA3K9TQe+z/nrWXd81Rydg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g5Nvi0rEjRZXjtl0/qXV1snjlwNg5EkLakxzBIk9AQQdTGdhr2qd1Qjq6X06BXwQvid/XXRyv166s4geVHMoXa2oa6cEqdtqZwGpexOz/LpTi/hbOhSa+tFbiGL/7bYoApDN+jJZR5sgOkek2Q85PDH/OglVmV6+L/hdeVtiBWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BqbR65uk; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BqbR65uk"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-22113560c57so54047615ad.2
        for <asahi@lists.linux.dev>; Fri, 21 Feb 2025 16:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740183427; x=1740788227; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8r7+y5SJBip6iQOe2wHWa44kb87aSgNqK+A4dnbHC4=;
        b=BqbR65ukn2AtC2d0zbSo0mJSb/+2qpjOMOK+uOc0FHB17XSiu8eVDtLbdBz5/CEgRW
         zEPF6O7wNMPBINc/SpUCalr+kJDeuEIHRUht4ELJ57mY4qwWt0bB/tKrLyW3Lmhoqka8
         oHKufsZ8Bbp2A3rXykuf3zb5I2wDY6I8NFWfxxV+GI96g4P2Xr4v/myXGX2S3R2/acts
         IQgSivSbsAX92o2p9t/fHj5IK0U8O4fM92lJ8n6SPu0wz2UCX+yyq7RrtrUJtTXEp2IK
         ORjo/LhgdKOorC2Q5LsX+rnCKm9eb5vy6AKh7DvvavM2i95HQ8H2mkdpY6mZ9IqbLlCy
         UoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740183427; x=1740788227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8r7+y5SJBip6iQOe2wHWa44kb87aSgNqK+A4dnbHC4=;
        b=Bx8bgJcz1NfkbF4bl8TjluAB5cMVbQzenN5/tPxAVDo+qp1NEZ2Pte62qAk/W+3pUY
         jfpCyCM/ObkcuIKtVGgiKsZmvrRzxN3J3YXHvPp3xN5LmhmEihAN8TLCjpAHC577TCmy
         C7eoi1TlQZwYavoyDnGxwu31c8krrRj6Lh2piVjQwi9QRJFOAu3VgAaFxGKDtY+UFHdb
         Ul0fVitUWQwWWUcYtXUk7K1b+iCONTy884ju451meIJsVjjqeBZruVM+yyTI74JusnWD
         x32bwO07iwaCXYo+xTb1D8V1nM0x4dffBUCMH/KHObO5bR8ZqevmSAWttc3gUt1dHhyr
         7nyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbOJvsoawGurySjJhfRaMTcu7Uo5cTZEUImHno1cAdEH6TM4H4V+R1ui78CLnFvOdCTPIywg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxP6s5+WNNjIP88fGHs1VgBvZXcvbE42V4azxQqJLLLuiQGcOLx
	19Un/3WxF3gizrUGy6uAdKH27Nq4ZAKSiuvGzewtXoGohcQD0Dk7wrBPEKLS
X-Gm-Gg: ASbGncvTaYyZkVzPjk/4DW7notxvOC/d0L/bjLoIDJ1lyWZDPHFvzIg4P0Su2cUekSb
	xTUQBcb64FRTjw2jQC2ySyLkqngJZgPBEhABEgltQJdIEk5hr3HR7hPOB5TXYpfRVb0URP6L3Ks
	A8K43kl/fO58e0l+53zMfxQgGwHDLkml2m7SLsfLmh+YZFUmAK88AKSR+CkqXNISvJ7q34bpLyE
	pkF+KnAiwotRFFIDmyOdnsmy+53UYbmljb1Bad3EQOJCNLj/IARJ85D1VZDtFwtjd+izESYED07
	LMCAee//UErww9TH0VK8trTheXn9T8GbaGMjQFzCvnxUlmt8U20B8sXzVsgYGmK4CDZfdHfjUfL
	BRP4zFdG7633b6Gihju8KYDKo
X-Google-Smtp-Source: AGHT+IE1KT+jsLeYcAoG6RbWaNlaDRP+N3w0uHd3VKbF9XIGUtNL+tdpdnurdl0Wr+EIr+ZaQK09lQ==
X-Received: by 2002:a17:903:1cc:b0:220:e336:94e with SMTP id d9443c01a7336-221a0ed738emr72468355ad.15.1740183427150;
        Fri, 21 Feb 2025 16:17:07 -0800 (PST)
Received: from setsuna.localnet (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d039sm141779875ad.133.2025.02.21.16.17.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 16:17:06 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>,
 Jean Delvare <jdelvare@suse.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 14/29] ASoC: tas2770: expose die temp to hwmon
Date: Sat, 22 Feb 2025 10:16:57 +1000
Message-ID: <4993899.31r3eYUQgx@setsuna>
In-Reply-To: <409e8873-5ebd-41af-8162-30668271be6a@roeck-us.net>
References:
 <20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com>
 <CAHgNfTzfK4HnYs+LDH7kcR+pZqSxT9YBZYQ=c+Mcpva4Vx=D_w@mail.gmail.com>
 <409e8873-5ebd-41af-8162-30668271be6a@roeck-us.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Saturday, 22 February 2025 1:03:38=E2=80=AFam Australian Eastern Standar=
d Time=20
Guenter Roeck wrote:
> On 2/21/25 03:31, James Calligeros wrote:
> > On Wed, Feb 19, 2025 at 1:20=E2=80=AFAM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >> On 2/18/25 00:35, James Calligeros wrote:
> >>> +static int tas2770_hwmon_read(struct device *dev,
> >>> +                           enum hwmon_sensor_types type,
> >>> +                           u32 attr, int channel, long *val)
> >>> +{
> >>> +     struct tas2770_priv *tas2770 =3D
> >>> i2c_get_clientdata(to_i2c_client(dev)); +     int ret;
> >>> +
> >>> +     switch (attr) {
> >>> +     case hwmon_temp_input:
> >>> +             ret =3D tas2770_read_die_temp(tas2770, (int *)val);
> >>=20
> >> Type casting a pointer like this is never a good idea. This only works
> >> if sizeof(int) =3D=3D sizeof(long).
> >=20
> > I will rework this when dropping the die temp sysfs interface. This
> > was mostly so that
> > I didn't have to change any of the code there, but since we're going
> > to drop that
> > anyway it's redundant.
> >=20
> >>> +             if (!ret)
> >>> +                     *val *=3D 1000;
> >>=20
> >> The calculations in the previous patch suggest that this is wrong.
> >>=20
> >> Either case, this is redundant. The temperature is already displayed
> >> as device specific sysfs attribute. Displaying it twice does not make
> >> sense. I would suggest to either drop the sysfs attribute in the
> >> previous patch or to drop this patch.
> >=20
> > The calculation in the datasheet yields the temperature in degrees
> > Celsius.
> > hwmon consumers expect temperatures in "millidegrees" Celsius as per the
> > sysfs interface documentation[1]. Regardless, as above I will likely
> > rework this
> Yes, I am well aware of that.
>=20
> > when dropping the die temp sysfs interface so that things are a little
> > more logical.
>=20
> Unless I really misread the code, tas2770_read_die_temp() doesn't return
> the temperature in degrees C.
>=20
> Guenter

My mistake. We return an intermediate value that is then manipulated in
die_temp_show() to yield degrees. I will clean this up for the next submiss=
ion
since we will no longer require the sysfs interface at all. Apologies for t=
he
confusion.

Regards,
James




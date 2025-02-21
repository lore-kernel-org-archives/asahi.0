Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB7A1DDC3F
	for <asahi@lists.linux.dev>; Fri, 21 Feb 2025 11:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740137482; cv=none; b=oUxLkdppMFdVQtkn6KUMP2j5NRGJAKw13HuPc16CGQvbKLwZsrha1mYGJQp1SBMNsjS00coMC1ShJlt8OevcGP06MpbPvGylSGov7KZxEe7OEzy3SfR6IThtkKwgoXHzMqevbydTTGVf4LbPOY3rW3xIP/DNmML64GeQbYzjdH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740137482; c=relaxed/simple;
	bh=2sYSAvls+4ReyVP1ib+1dhbqf+0o0BnL1erhUxo8L90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J9fmtbpHfSGYYQLDgYDj1lxmu3JNY8YqOPt9i2cEQwVbWDzWdb/aeDSyW9S2h9FtTmrAkth/NbMXPkmTAXkcZ7Xxfr3dkHodA9zbRcZsHeGx8/WZDlUwODUWxFdEZgyIEQtcDi94Nscx3/WMct3G9kVSAaYjmFmgnT99gDiDkTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzQ4IT/V; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzQ4IT/V"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-46fa764aac2so17563141cf.1
        for <asahi@lists.linux.dev>; Fri, 21 Feb 2025 03:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740137479; x=1740742279; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLzzEgvqFE7GbnZ2AxDXQJUzBi6py5ZBkycvuKHjYMY=;
        b=GzQ4IT/V+k0WulQI+6Iq+4JgQupp6HSszryaEidBYbrJXRkeyBDrf5TjuuYmTJ9Nxk
         2TYhkvFCABUrTroNNzqYnE6oqiwerCqeZp8cug4+wkAq63I4d/nWUv5lyiBaXXtzGKJZ
         ELNaelR8r84zspbgYgeP9fLN/3hzq5WYOYHrOHRPjzVlMf/BuN4SsmBhmaPA4jQqFrLL
         yDjxRmIGM690ZCYYOadMh7iditnjPNWV1odVBBBQP7nTL2PFhAILr00Ux0iL9buHgBPf
         Iv5N0pQnyYNTVq1nyFHgZ7TRRbNts1nHLhUvwQao67xf04gEHjw5SzA0HETZDuu9ukqh
         Bj9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740137479; x=1740742279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLzzEgvqFE7GbnZ2AxDXQJUzBi6py5ZBkycvuKHjYMY=;
        b=M/M891lt8/oqeCooXtUt+NOBj/h5lIMdgWw/fM3yqmM3OkwStUc5xl9K4Yb9zHHvyb
         gvLyD0SkDTFnedG12JTzNAKYU8XwBVJMssVHv4twE8FJsOzHOz3jeqo3LQMMXo0K8iEx
         XwVk0qE8xBMZvLIc0Awq+roYC/WXCj+C6meFTLif3qXit0xLaUKKUArjPXD3h6Wvzf28
         UMxwswpGuv2GYud/VUr8T4bHWJhMNTqRRPA5KUPwyqKmWzuIWOyd5YbLd6f2GHZlUcpN
         KU/a5hif9vZauuQtwdkQlme8g8HxWKPsIA3mvMGmLfz+RdQfzdNFJ3a+GWd9+BS6T3xi
         g+1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWDdkqAwUazVbOhH8Wa9WblzBIcGsrIoKeYW8NSAyIn8gHFfIQt4hwLPB7slgjjBK4bh60qhg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzD2KV8dyEZHNJkLuL1EN/yI++y7P7RhsVTQvQxWFK7rItI3f45
	maF0DzaXxmYMPMLWegcYL3F5HG4fzOijgDdo89Lw8eLFfrl2osGa+jW2ANbUR4/Lj02NSP0+6Oi
	hG/isntEXO81OKF2PcgYuiqNm7E4=
X-Gm-Gg: ASbGncssMYIf/ZeHir5f9+Sb7wWEYD91qIhvf0WR4yLdKor9Yp2nwNh3130tf9ZDyGY
	8HNDOgfceATE/JfkVd9kR8Ks5GWbDINZm6wMKicGl/DvdPmLmKPPZgXR5HpCLU7yb+f3n4lrvuJ
	e1moED/M5Ac21xuIAg9i9zxPJim8kXXXgV+uJrbA==
X-Google-Smtp-Source: AGHT+IFXgBHzvJE7xTARImFvwXCJFuJ53+r7HKxZ0EgS/TsYE76YhhfXmNth8OohHrtxj5r3VNLo5+k7NxnowBJnZyM=
X-Received: by 2002:a05:622a:101:b0:472:1b70:ee35 with SMTP id
 d75a77b69052e-472228b445dmr33601771cf.3.1740137479508; Fri, 21 Feb 2025
 03:31:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com>
 <20250218-apple-codec-changes-v2-14-932760fd7e07@gmail.com> <4e0e2ae0-c53d-444c-9d8a-d465be690232@roeck-us.net>
In-Reply-To: <4e0e2ae0-c53d-444c-9d8a-d465be690232@roeck-us.net>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Fri, 21 Feb 2025 21:31:08 +1000
X-Gm-Features: AWEUYZkxOvXOcjPt0xQT1Ig8EoTQnHW-sw6rQquHl8P6f2lTyg4bCTVsUynHGrI
Message-ID: <CAHgNfTzfK4HnYs+LDH7kcR+pZqSxT9YBZYQ=c+Mcpva4Vx=D_w@mail.gmail.com>
Subject: Re: [PATCH v2 14/29] ASoC: tas2770: expose die temp to hwmon
To: Guenter Roeck <linux@roeck-us.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shi Fu <shifu0704@thundersoft.com>, Jean Delvare <jdelvare@suse.com>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	asahi@lists.linux.dev, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 1:20=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 2/18/25 00:35, James Calligeros wrote:
> > +static int tas2770_hwmon_read(struct device *dev,
> > +                           enum hwmon_sensor_types type,
> > +                           u32 attr, int channel, long *val)
> > +{
> > +     struct tas2770_priv *tas2770 =3D i2c_get_clientdata(to_i2c_client=
(dev));
> > +     int ret;
> > +
> > +     switch (attr) {
> > +     case hwmon_temp_input:
> > +             ret =3D tas2770_read_die_temp(tas2770, (int *)val);
>
> Type casting a pointer like this is never a good idea. This only works
> if sizeof(int) =3D=3D sizeof(long).

I will rework this when dropping the die temp sysfs interface. This
was mostly so that
I didn't have to change any of the code there, but since we're going
to drop that
anyway it's redundant.

> > +             if (!ret)
> > +                     *val *=3D 1000;
>
> The calculations in the previous patch suggest that this is wrong.
>
> Either case, this is redundant. The temperature is already displayed
> as device specific sysfs attribute. Displaying it twice does not make sen=
se.
> I would suggest to either drop the sysfs attribute in the previous patch
> or to drop this patch.

The calculation in the datasheet yields the temperature in degrees Celsius.
hwmon consumers expect temperatures in "millidegrees" Celsius as per the
sysfs interface documentation[1]. Regardless, as above I will likely rework=
 this
when dropping the die temp sysfs interface so that things are a little
more logical.

Regards,
James

[1] https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface

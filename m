Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18C5321457
	for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 22:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756332438; cv=none; b=mEfe9tAwkRXGJqJByPC7kpXmYhUxr9umC/QeliWVBjdFOPyQzaSxp/qgZx4IARbiL1dGV54pvKEYCjKs+Aseuo3aRW4gGWFvsyoh+X84nTXdUP1a23iZOEhpo5QvuOZZYi+XgpYL3RRUju2vYrbsSLC4X8e0LCJUjtrRz99SeZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756332438; c=relaxed/simple;
	bh=vUC4qlsxVvPTVPExTfWGe5A+3iWqGaWbw/x33NuF0r0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ACywZF10O9ymwyQDTznDRxJE49DxblFA0GCRulruwC73m0J3UCxHwi3uth+N5Vly4wZzM0Gc5c9ui1N+Z0O+T7N0whpReIgU0cSwCddt5texc2zVLqeoygloeeetkLyq2Q3rhE5WG/cXECoG3HYkn6hwrOxbP4bLbj/LFetOTmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCzuhm42; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCzuhm42"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7e864c4615aso155595885a.1
        for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 15:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756332436; x=1756937236; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUC4qlsxVvPTVPExTfWGe5A+3iWqGaWbw/x33NuF0r0=;
        b=kCzuhm42zFVWx8WfrCf3FBi10YbxW44JggDs1WwMp3UEwEZNCi8z1vr0xp9o/ANQF/
         R4IKiGPom3RgfYKiYd/U0BPZmMC3dvM+fQnREtbza7ZfetWmzJSWZ/+r22nL87t/ybe1
         QgXA//i1rcY418iIF6zkwpn4rVSNFS7xPPzIvQBI07xXRkK9gGCenh/cMLFsH6pyV9hL
         fTxl9IAwOIH/zAh8EiVQVbHPUu0i1J1rC73Vro43X1BwSogm3y52Z0RLq3tQHGHMdG2P
         qLQIW/AjSeIz3/mummCN10QsH5NoorQeDybXv0+yBKN/5dLEjlXd2AaM3w30hW656q7U
         tMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756332436; x=1756937236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUC4qlsxVvPTVPExTfWGe5A+3iWqGaWbw/x33NuF0r0=;
        b=F4JepEIl0GdCbAYWlYYQk+km6edKepv0eX0p9nbldwylOvw5jSXQ+3zXfBVJ5EftlC
         vrvILm48OIOKMq4aEQ9evBODVCQ8/Srz4UqJ/zw34UzLv9n2orSQjvoTC4EfomWHMYjO
         8bUI86SQx5QxyklZLDILWAj8HjAKo1K+jarR5NB4UWLBaVaKiAZ93wGo5bYoRoLgDzb+
         dzjLdBwPD+1C4H6YFv5GW0X2bJoBaSrB8K8Q8oldEOyX7ssJi0AhP8EA61jaP+ArfLzE
         8DsOKVDKUnvY2jcSKaG51MOSsZq8TSAfJrgneMF/XCtrsf4s3G5h8YpL5idMof7VGAHt
         8Wow==
X-Forwarded-Encrypted: i=1; AJvYcCXOazrSV+tlXGye5FGFiMcdsS6oJ9Oj28R2fU3IQGa+ZFwBofn86s/m9cOY+ilPYnuIru+oUw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1aFuYA/3MdgjyFJHJQcUIsSUp+0kJLPL/J/x1grlNgu2rpixU
	M5XcOCEbAs+cPx0zZ/Q3l58XeOhHd9nh6TgStJXFmnlilzNXKdPE/ypPzHrEqLYEfmZEV0NV4JU
	fb0WrUOZ5rL9VXhfTjCZiNUxAqj0H+S8=
X-Gm-Gg: ASbGnctqV5ehJw5Ja7aIWuPgxOSD5B0sTCvtml9ZaRSVGCkSqvvr/E+egpZ5Z2NalW9
	d/Pd71zbck3E18iQHBFMi9xpSn0KDPuPY8YQ251bIkpLmPAUkiDBN1ilbw5ffaHWXUSqnrc87XO
	lwmUIqwHTa0lBfws7Zmt6sGhv8EynfCFYVarEylA3zDxTyGIz1YEZrHP90B2JXXoKUkW8WabQoE
	BSZeg==
X-Google-Smtp-Source: AGHT+IFWnq8ORXAI8SSjemzLtCbxSTUPIYIEaJ5tGH8UF3103yXoCHbrBxVEF+Bu2TrfLXMCEXU8uRfcWJlgWZbs5Og=
X-Received: by 2002:a05:620a:390a:b0:7e8:8086:cb83 with SMTP id
 af79cd13be357-7f58d941ce0mr891896885a.28.1756332435727; Wed, 27 Aug 2025
 15:07:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com> <cff7c8d0-cdd8-4ba5-864a-936a059624d8@roeck-us.net>
In-Reply-To: <cff7c8d0-cdd8-4ba5-864a-936a059624d8@roeck-us.net>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 28 Aug 2025 08:06:57 +1000
X-Gm-Features: Ac12FXwItn5RDOOJRHCpy_8GPQsXlU1HYJaUvZiX6yrBr_5ZrTi13wSDfRmUQBk
Message-ID: <CAHgNfTx32B4p6U8Z+dy02jWdQhW0uR3ytovc5u-3bE8kNk=p4Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] mfd: macsmc: add rtc, hwmon and hid subdevices
To: Guenter Roeck <linux@roeck-us.net>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Jean Delvare <jdelvare@suse.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org, 
	Mark Kettenis <kettenis@openbsd.org>, Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 11:47=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
> > ---
> > Changes in v2:
> > - Added Rob's R-b tag to RTC DT binding
> > - Removed redundant nesting from hwmon DT binding
> > - Dedpulicated property definitions in hwmon DT schema
> > - Made label a required property for hwmon DT nodes
> > - Clarified semantics in hwmon DT schema definitions
> > - Split mfd tree changes into separate commits
> > - Fixed numerous style errors in hwmon driver
> > - Addressed Guenter's initial feedback on the hwmon driver
>
> Don't you think that is a bit useless ? You might as well say "Addressed
> feedback comments" and be done with the change log.
>
> Guenter

I don't think this warrants a v3, so hopefully the amended
changelog below will suffice.

---
Changes in v2:
- Added Rob's R-b tag to RTC DT binding
- Removed redundant nesting from hwmon DT binding
- Dedpulicated property definitions in hwmon DT schema
- Made label a required property for hwmon DT nodes
- Clarified semantics in hwmon DT schema definitions
- Split mfd tree changes into separate commits
- Fixed numerous style errors in hwmon driver
- Removed log messages sysfs read/write functions in hwmon driver
- Removed ignored errors from hwmon driver
- Removed uses of dev_err for non-errors in hwmon driver
- Made it more obvious that a number of hwmon fan properties are optional
- Modified hwmon driver to reflect DT schema changes
- Added compatible property to hwmon node
- Link to v1: https://lore.kernel.org/r/20250819-macsmc-subdevs-v1-0-57df6c=
3e5f19@gmail.com

James

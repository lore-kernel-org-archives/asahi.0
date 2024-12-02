Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00CA970818
	for <asahi@lists.linux.dev>; Mon,  2 Dec 2024 17:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733160666; cv=none; b=uuSg4wwxTVDHivRjLvc+GiBlcRuLCKoYasEzNNT1pgzkwdPIiEb6Ir58pu2FkYgbKAeYTAULHd1ISjZmV+HGaIrowGKWhfmMaGuM4Xj1e0ZL9VKBkg6gJUGD0xNyAsWFt4QRhMKDN+VRj8lYysV9JklfniNGMpugfqfBQqfadnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733160666; c=relaxed/simple;
	bh=4JKZtSuEmqMuXeOBZrPyNLIm8CYD/ejkuMqx3I2WX1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzVOgDN1n+J8f64eCsLSRR8dXBLicSViO6VdOSe0Ig8WDSueSPSIOaPNol/D1GReyN/mMqGWp9Ut/uFOefgzMin2REcAH17mz9b9PHoY+GNQMEBtIOziESiXdJ4IK8aQjqAwleugktqOU1G4ziOBzhSCXIyhV3htC0ajpqrv1uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so77755066b.0
        for <asahi@lists.linux.dev>; Mon, 02 Dec 2024 09:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733160663; x=1733765463;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R4Uhvy8tTjWy5oxzfIAviwoG/Zaxlrw3hfu/LH+0UAk=;
        b=bB3C6gHnk16SMq9DjXoOv4g9Aa8CXJ1i0HC/A8NSmN4m6BaWv5hiedOOzEl0GKj9em
         +d21CT2qkCwhbLLe+yu7T7nCz3HJpgBdedGuew1WLPDR2DWDw1Rddw5UrNl7keRvL9c3
         ckt6tzv1X2+BmkizEW1HF01XoJ0OB0fM6G+kN31viuAmoJxl2aA53/jmF8WKvArqjNBY
         nMiIpK4Y0v5mIQtUA6NPHeJyqMeR96uVluFPf9I4OQ+Q1VUJj3+bQa8U0gHMysgSH8AW
         6P4mXCkwHOieYVjNvAlHXo71kQmSDVvjBSEXPXLt7FRwTo50grzjFsn/ynRNOkIO/sXj
         L03g==
X-Forwarded-Encrypted: i=1; AJvYcCWWD2ZnB75iquQWPJKIzrAHtAsLK0hnntYir9+XM56UQhgoudj3C75DcXlSLedAJxFn/aMpXA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0GTZCNjhE+TQkX2vIT1t/N3EFPnPy0O1aEwOMajqO7nC5ZC+u
	HH9QVZV8n+QUnQAP28mYcO6MCSbdSq4S2ZDOBoEcxirhHfvIUCOo+ckDqaRn2OY=
X-Gm-Gg: ASbGncs/MWmuZ4OIFu2r66cmVBYGr7FxIEWciq63ndrJs/H0LB+Rj7gfj8fWx+Fc0Y4
	aldUTGmiytv0Et5Lj87YwDekb5hzbEUIGPi74sRC6Yq3S1q1tgrwNDKnHpBogSptpEiGuxbWl9B
	33CPLtKlklLNmim0dU2sFk2hRU5wYd0iRv8WnTK7PGEY3EXtBWEWOae9GWRVJ0How6ibwbqHvzE
	EysVR0Wv0W5PW+OwU+9R8otC6Ti/y7s9kCH+jZ9i9tWILhtnAx8Pe/9fDR1oEcNhMHPJ5EfgGss
	7DsL
X-Google-Smtp-Source: AGHT+IEC1Pv77oSTEIDqotWsG43XPXqWY9orjwk7VsBmuLfARf3bJBcgEH94j7Qz0tOZg7MshmOTEw==
X-Received: by 2002:a17:906:31ca:b0:a9a:3cec:b322 with SMTP id a640c23a62f3a-aa58103db92mr2487969166b.45.1733160662144;
        Mon, 02 Dec 2024 09:31:02 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6337sm528505766b.117.2024.12.02.09.31.01
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 09:31:01 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so77739866b.0
        for <asahi@lists.linux.dev>; Mon, 02 Dec 2024 09:31:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7X608pQTs0KNjNQKvaN3P+aKzjoQqcJODu5bBt1ZoirmvLOwF9SzB5XY1lsu1yY7Tr++uGw==@lists.linux.dev
X-Received: by 2002:a17:906:2932:b0:a9a:238a:381d with SMTP id
 a640c23a62f3a-aa581073eadmr2214547066b.52.1733160660680; Mon, 02 Dec 2024
 09:31:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
In-Reply-To: <20241128-z2-v2-0-76cc59bbf117@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 2 Dec 2024 12:30:23 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_bx2aa-LpSgWjRjwWMGa9NDF9YbwkT1pP42s5=791oPQ@mail.gmail.com>
Message-ID: <CAEg-Je_bx2aa-LpSgWjRjwWMGa9NDF9YbwkT1pP42s5=791oPQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Driver for Apple Z2 touchscreens.
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 28, 2024 at 5:29=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> Hi.
>
> This series adds support for Apple touchscreens using the Z2 protocol.
> Those are used as the primary touchscreen on mobile Apple devices, and fo=
r the
> touchbar on laptops using the M-series chips. (T1/T2 laptops have a copro=
cessor
> in charge of speaking Z2 to the touchbar).
>
> Originally sent as a RFC at https://lore.kernel.org/all/20230223-z2-for-m=
l-v1-0-028f2b85dc15@gmail.com/
> The changes since then mostly address the review feedback, but also
> add another machine that has this specific controller.
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v2:
> - In a separate patch, fixed an issue that prevented the SPI controller
>   from using GPIO CS, and as such, moved the hardware quirk to there
> - Went back to uploading the firmware in probe() instad of open()
> - Other changes addressing the review feedback
> - Link to v1: https://lore.kernel.org/r/20241126-z2-v1-0-c43c4cc6200d@gma=
il.com
>
> ---
> Sasha Finkelstein (4):
>       dt-bindings: input: touchscreen: Add Z2 controller
>       input: apple_z2: Add a driver for Apple Z2 touchscreens
>       arm64: dts: apple: Add touchbar digitizer nodes
>       MAINTAINERS: Add entries for Apple Z2 touchscreen driver
>
>  .../input/touchscreen/apple,z2-multitouch.yaml     |  69 ++++
>  MAINTAINERS                                        |   2 +
>  arch/arm64/boot/dts/apple/t8103-j293.dts           |  26 ++
>  arch/arm64/boot/dts/apple/t8103.dtsi               |  20 +
>  arch/arm64/boot/dts/apple/t8112-j493.dts           |  24 ++
>  arch/arm64/boot/dts/apple/t8112.dtsi               |  14 +
>  drivers/input/touchscreen/Kconfig                  |  13 +
>  drivers/input/touchscreen/Makefile                 |   1 +
>  drivers/input/touchscreen/apple_z2.c               | 458 +++++++++++++++=
++++++
>  9 files changed, 627 insertions(+)
> ---
> base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
> change-id: 20241124-z2-c012b528ea0d
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

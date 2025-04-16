Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AB217BB21
	for <asahi@lists.linux.dev>; Wed, 16 Apr 2025 01:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744767681; cv=none; b=jNzZOvrUXWheirTuLd2Y0QVzU3eVXxtTHe16jZXDCofpxu1NBZ3Gx7CZAGtzj29/hs6PLu2q8Fl1sk3YgIsOlkX1UJACJUF6mwhJsVLX+WYcLi9bswRTgxmht2QApn33pCDl1PD31Hya01ae+Ha+xSPn5gRB5X0N+iUp7ns30sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744767681; c=relaxed/simple;
	bh=QZ2Ud1Y/3tEvAgsIgosukIl8HjPWFwS4NpOavajMkUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uy8MGaQ5Zdp/aCuLEkzaQAUEelLNh81wGrbeBvpUjzJBvEsZTaxCYnFfwe+hSlTHWIdPldt37Riv+wtIcbp0y0Q4qQipvDMI4Q3/GFWAPLWKrD2Tq53bJ3OMdo+Nx1K8QC7z/jc8m47Hu6Q07IGII35du106J7vFLdS4OZl4CCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso1159027566b.3
        for <asahi@lists.linux.dev>; Tue, 15 Apr 2025 18:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744767678; x=1745372478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twB0aG5oSy2aYBf8sj1I4DoY6eJcYgS5UGe7JOXKGEw=;
        b=YtuFHZ+AOdveVErqm3cXpQtM3GvyY0tYcj9VjaBFxSQA3SVtI+k4iyvK4+QtKGH6vk
         5HKLH3SiOepJAEM4EPpEHHgqoiVRxo+ICVQUCuCiSeZ09+gRLjGPCOOJU2XRtVsQm0A7
         MyEuvXIMiAUJwCrSuteg+3Xqv86ZkFVCB8taNk9N4wSeHqg71Q/F6nk38mp8gpFhhe9y
         898//RxFt16UNv0KEoZXJneYHux6chUkvAMc2S2vDoghGcGl9d5IdE/Bxi4oM3sb5b9l
         CU6mP2ASw4l22xGs/39eEE4ZehTo2LmZ4XXAS6KB8m6hAW4KYrH/5cM13OkdVOscuHFA
         KPUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJIBsjHDx+17ITs9hREZCR1ZRGp7vNesOx3cGXeqnrUB+KU3eEa5p7ePWB/V59H635O/ffDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZ1484+j3jOeoGkTjFzO6HDAt3s3WUUUAPJ/CBtzQeH1rn8c2M
	4Kj66noZ0McOc73kFki4P5SRUmEyY64+Kxjznxga4RM4GLtjVYgog3TUUr1eJqU=
X-Gm-Gg: ASbGnctgh1OligClH1CX5+OmD5tEgRfxolkxNiNCMpa86SD1TWHcUTVDzfK3LSf5CuR
	jZCKfxQtJ0Qf6rZyJB9gPGYCh0C1MvtgQq7qdci6aGtUc/6qewPvdMhbU1QlHGo1Xwz6USYO5jI
	Ks+R8E6zjwa5m1sE5P7BtZOUwH5/qO/HhoJBMiIcRpr5g0F9z56LC8YlX3LJaTG4K24pYl3n3yd
	wbsIvRkUdPHT0C8oJ1jI2Dtyc0bzr91ATfBmwcFoFWWhcGq6iqCxKx9GOHQu7oa0nAAiq6NO4BU
	JGELfh0HzCvsDWe5Qub39EkKk5IX5LGW5G7MlbeOkmxaKLfcjMq/oVVN9HMOQBEaHa7acA0=
X-Google-Smtp-Source: AGHT+IGis/5a5nm4ymtan15SiVgMG2DlBpRXIK3+QC3GiDEpoFXNgdnSuiuBzHzHOebu4zUFShGRuw==
X-Received: by 2002:a17:907:1c84:b0:ac6:f4c1:b797 with SMTP id a640c23a62f3a-acb38224568mr99337566b.19.1744767677952;
        Tue, 15 Apr 2025 18:41:17 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3cdddda0sm29719466b.63.2025.04.15.18.41.17
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 18:41:17 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so1174719666b.2
        for <asahi@lists.linux.dev>; Tue, 15 Apr 2025 18:41:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVr3B9/eTgA9Vjr9pSiu5866V69l4S6tCccVscOSvVFs7FxpDkWgSQQbRyIU37yIwaBmqcj5g==@lists.linux.dev
X-Received: by 2002:a17:907:3d8f:b0:ac3:bd68:24f0 with SMTP id
 a640c23a62f3a-acb381ab306mr100622966b.7.1744767677634; Tue, 15 Apr 2025
 18:41:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com> <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com>
In-Reply-To: <20250415-spmi-nvmem-v1-2-22067be253cf@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 15 Apr 2025 21:40:41 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9YWME75EqPYNU6LuhUo0kgcWfOh2qoo3WwQx0K1vObyg@mail.gmail.com>
X-Gm-Features: ATxdqUFONgVQ32LYCamWZQFAdqw-HYKzsclM2qfgVOPEPhemzTQ_TdOV1fFem4w
Message-ID: <CAEg-Je9YWME75EqPYNU6LuhUo0kgcWfOh2qoo3WwQx0K1vObyg@mail.gmail.com>
Subject: Re: [PATCH 2/3] nvmem: Add spmi-nvmem driver
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 5:52=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> From: Hector Martin <marcan@marcan.st>
>
> This driver exposes a SPMI device as an NVMEM device.
> It is intended to be used with e.g. PMUs/PMICs that are used to
> hold power management configuration, such as used on Apple Silicon
> Macs.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  MAINTAINERS                |  1 +
>  drivers/nvmem/Kconfig      | 14 +++++++++++
>  drivers/nvmem/Makefile     |  2 ++
>  drivers/nvmem/spmi-nvmem.c | 62 ++++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 79 insertions(+)
>

This driver code looks reasonable to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

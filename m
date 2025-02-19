Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9781D0F5A;
	Wed, 19 Feb 2025 11:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739963144; cv=none; b=V/hJhW+Y4EV5lSbWUDrUNRqB7k8O10wOFpoP7CWmmCswmTrEXPmOExVmWD3J58fdwnrBooS2uWYoZcllX5PATnCkvvLxv8hi/aVCXz01G7X4zGVkYaGRtN9mjiny6aX/vqSgjJmaWnM9lS4ncZ3oCbytM85m6G2Kydevi9m9AQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739963144; c=relaxed/simple;
	bh=3cp//M/sV12YOFZI+shyC4DjWt4VB+LwS/H5wzGNXB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bQyOd5XVbks51L4F26O6YvMMES9vZwUlyIuwdwWwKouUl5cW29Kf5mzM8XeUDn1BzHCc+jCKdoF/3vuOAkKoFi+eHbetOY9+2/GkHxuLhliDKKzZR47iyx8W/G/eFAVt8AYtRQaPcwZ7M54m0qY3BhnPl8fIBj1ueavgKPQBhNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PMn1Mhd8; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PMn1Mhd8"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e5ddd781316so2713479276.2;
        Wed, 19 Feb 2025 03:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739963141; x=1740567941; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/KCPDNMeea6cvXpnHeNMu1dpiWDklh2TuU8J67WkP9o=;
        b=PMn1Mhd8owUjnsPCyNeb187+ZOQMq+oWaA8NQBBjEPvvWkzFuP2tn6/0Q+oB39KF3J
         scTKPkw97B04KUmQFXUC62D4gkjCFoCTr2TgxC1X6oIPggHBRGkb73LwSfJBUxf/jPJ/
         SEgxVLCuA5i1kRqC3XuNosVUSoQX8xb+oFHIg+0qkGLGh9Fu0CxOaJnsPgiXx9oFJoe9
         8lnrxvz0q3jmwtqlrPc4TC4T5walPHsfc51FYOXvkG2YJa/ft0Xb2MgLVeoGkB4Er/TI
         uim4HdKlabY3otb+7ckf0DWczKt5l3i2lNP4dcdm0XlDVDU/QBPFAh+MncGIg1/kz1fP
         KKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739963141; x=1740567941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/KCPDNMeea6cvXpnHeNMu1dpiWDklh2TuU8J67WkP9o=;
        b=mAQWmVQBO/f3bTlyATpsdj6GgeRYiXr80pVMHa4cX/jnxz7s6S0TAvBI2fmjUVf+wN
         IdCdR1NZ9dWKSpUOENkuu06eBrscsU5hRuapHKsGfLPHHqUbaonQpryHybwNnPXk6MsU
         uZBmKL13+ju2oqexhHacaveat2X9FpNdPOwEHcOn9kw6rk/mJlMKPkqGnXu7yWHXBTdY
         +TRxvno6UgL//IW1mNQTDGHMTVvIX7S9dx0j6C9RKTuhJSTLEwyWmporcz9zQlxYDVCQ
         np5NiyGg3JM6SF0NM1ly+60xkkUaCpRcTu+6fbdVSV1KlCq23fwm+7SciSberJQXocD5
         /HRw==
X-Forwarded-Encrypted: i=1; AJvYcCXM5iIqpnLgVmpP0N4cW9edz1h7zHOeWVpu9eeAxOZylHUHO3YzdrcewZ4zkWCdB3SX88Ty@lists.linux.dev, AJvYcCXr+QZRLXIb6y1OncQl8PfhHgVrhsHFP3I5TdKaB/bXfTYjEFvi/Qm8w27sUaQVzH9DythFAg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yye7eo+x+7acuP6RVlzYQp4odrjPuKXjvyVdmBIRJZw9jfz30Pp
	3pYbRsCH/SRWaN9vXy853XFieHu0/LSV0KXr3vgMviRZJRHUTHBbmXwaxbTvDijpoKf6msM8xb6
	pfHqLJbnqPZX7kTvxaNejDlFu5VY=
X-Gm-Gg: ASbGncu6a32S+e+dXjF2t7BLEZoBLeGwtrP8TagAC2cJKPpA0937iZW4TUPcLGnLSDZ
	XeyXIuu3gI5wHvKrgVs6PZ9xSEGWIsM0OmkzNntrT6gzlLTKFBgF+1EL0qrtN1fRgAQ9i4jyQmg
	==
X-Google-Smtp-Source: AGHT+IFM7nPZ8tuQFLbd7DWBYfyE8wXlNRxQ8AMioKm2MbbUJCJH0PC+2gSNRcWOH4HRbsy98lSWob4Xz3NoErPmn1M=
X-Received: by 2002:a05:6902:2501:b0:e5b:1540:6c7d with SMTP id
 3f1490d57ef6-e5dc9536dbamr15187340276.49.1739963140849; Wed, 19 Feb 2025
 03:05:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250219-isp-v1-0-6d3e89b67c31@gmail.com> <20250219-isp-v1-3-6d3e89b67c31@gmail.com>
 <16f6d4a2-2102-48b9-a0ae-b8c6595975b8@kernel.org> <CAMT+MTR7dhtt3SOMg0K3UakJQftqnc2S-rV41HdHtA+o9aSPug@mail.gmail.com>
 <20250219105326.GA31383@pendragon.ideasonboard.com>
In-Reply-To: <20250219105326.GA31383@pendragon.ideasonboard.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 19 Feb 2025 12:05:29 +0100
X-Gm-Features: AWEUYZlUG9hH5el_Nj1wiDJlMQpA-IjzAT88JqmhR0NRl4eaH_UzxL_62EaFLEs
Message-ID: <CAMT+MTToVdm72ovNZ8ySySYe5fT99a0Y6bv02NKxADCBCe+pMQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] media: dt-bindings: Add Apple ISP
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Feb 2025 at 11:53, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> >
> > Those are board-specific and not discoverable via the ISP protocol.
>
> But they are settable through the ISP protocol, aren't they ? For
> instance, looking at isp-imx248.dtsi, the first four entries are
>
>         /* 1280x720 */
>         preset0 {
>                 apple,config-index = <0>;
>                 apple,input-size = <1296 736>;
>                 apple,output-size = <1280 720>;
>                 apple,crop = <8 8 1280 720>;
>         };
>
>         /* 960x720 (4:3) */
>         preset1 {
>                 apple,config-index = <0>;
>                 apple,input-size = <1296 736>;
>                 apple,output-size = <960 720>;
>                 apple,crop = <168 8 960 720>;
>         };
>
>         /* 960x540 (16:9) */
>         preset2 {
>                 apple,config-index = <0>;
>                 apple,input-size = <1296 736>;
>                 apple,output-size = <960 540>;
>                 apple,crop = <8 8 1280 720>;
>         };
>
>         /* 640x480 (4:3) */
>         preset3 {
>                 apple,config-index = <0>;
>                 apple,input-size = <1296 736>;
>                 apple,output-size = <640 480>;
>                 apple,crop = <168 8 960 720>;
>         };
>
> But I may be interested in capturing a 640x480 frame with cropping only
> and without scaling, with
>
> input-size = 1296x736
> output-size = 640x480
> crop = (328,128)/640x480
>
> Or I may want my cropped frame to be located in the upper-left corner:
>
> input-size = 1296x736
> output-size = 640x480
> crop = (8,8)/640x480
>
> If I set those parameters through the ISP protocol, won't it work ?
>
> --
> Regards,
>
> Laurent Pinchart

For cropping - you do not want to change those parameters, the sensor
is partially occluded, and the crop area is specified in such a way
to not expose those pixels. As for scaling - we can expose only the 1:1
scale and let userspace deal with it, but it appears that it expects
the other common output sizes to exist.

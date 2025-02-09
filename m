Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3299C156C62;
	Sun,  9 Feb 2025 10:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739098247; cv=none; b=NNTdXyo/DSRefFTRxh/chLvLCeEjcN/EIB1RAD17Owl1BvaxdAsYDaX5Q5ktgNCN8tR/8IyxjKmQfPH3U2sfdK9VPktP9/EHeR0TUEUDm0CQWJve6B4kpk37yLHj/5HHo5cRP/vrno7l6lgRIAKXXhHhGxea2sMiPl/qJjC8J+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739098247; c=relaxed/simple;
	bh=r2fNX8jXTrmClDffUPWS9Nyrk9owTWmYmVsTLUmM6cY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vCyhrUCfKamulOKzq+iyoXZhNSMXHmEcij6/jmo45kExdOVnMkEz0RfqQhm4Dc5KdKpLEpxh/4d9he4V+ZddowP4v4ab/Yf22k6c6w5+PTXONC7Yp5qVyeJ9wCQ54QoS+JTQAquI1LIWsUDH/CvgEN+hQa5WLQ7m3B0g3ljXF+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ab78bcb4b19so388952366b.2;
        Sun, 09 Feb 2025 02:50:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739098243; x=1739703043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MH62dPG8Qx2NOdEQyz+qopTma+UfkmuG4FC6VlOsB4M=;
        b=rSx6ClapWdGwn1oG0tOw4fDZKcb3V472gy0VNbu77OvWnyw5TlsbrdaJ6vZBgAG1wb
         DrA3o40+1F3tb06fKzfTyR/yyXo0ayWDGfIBW4Kx3ypkFMkqG5FlKBePTP8OcFYZ5Mwk
         6k2V7q0at2aZBtCuLgLHGtQVlbNxfXmvDLcxQ0bvo1ctdqU7bparJikv44WHgowr3xhq
         ljPhBfoFu1x11DkW5QicdcoNeBp75dUKF/Qsbti4yYwGOywazu3rPprrxc3KZ9JnfUGZ
         LyVgJjtmFOyHkzR/5redbKCD3AqCmRE1X66lo6WG1hVtKofec8n+KbonOYArPFfFI6TF
         6+JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUcuGfaHxriyVX5oytQgXjysVAehy+9cDI7goH7LgZ6pfrStZSIdxiUBS+MDNOliFqs3k9@lists.linux.dev, AJvYcCXzaMQpLDriSMwk1U5oyDBO2dYvgQjQR3XZItTDLBJOfpKkrOzk8jMSj4Tpgrb+2zL0r/K6vw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMkanR20k7QbRvMmVvuJ6qZjwdWnK0SmONwmFyr9mQeuZhu5UD
	32b+TRdGqmr/l6txz1GaE/ZSp+Bp0nbHJCPsvFL3WRkUQnHp83L5991G1xlCHkk=
X-Gm-Gg: ASbGnctT0BJDTxJhXJMLULimlZjVZZS/fk5I1HnELp4rEp1POmdCr4pXhRJDJ4S/CZ/
	xUelhp9pBXPzRMFA2ePmbuNKvHhXevbbBbME1k7yDIhp46qsQPzFOS8JFnH/yB1JtDXev12oPRO
	3ryqkBfCGuoT5AP6BmVt6DEw2qRU+13NuzqGO3K0TuyFCtU032nLYbn48dVfxiz638WW6fBN+B5
	FyceLCQ/qzRNwQYLc1s80Soz7R21S/5kbP0J/nM35NgBWAXxLXBKLbFYkB6XFiJnFBHjn4um/zT
	UxHgz/rs9kwUBipKtR5T3GDazFE/omoDVscxG+aV/ZwJRA==
X-Google-Smtp-Source: AGHT+IGAr87XDWuRoEzegPmVNCyG6JugVRDSKn7dZ9bS/U/whe6x9osK5+jCEKbCFCGLpTuqH5gQ5Q==
X-Received: by 2002:a17:907:a28d:b0:ab7:bcf1:264 with SMTP id a640c23a62f3a-ab7bcf1108amr54247566b.5.1739098243004;
        Sun, 09 Feb 2025 02:50:43 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab78b9b09b3sm500083966b.99.2025.02.09.02.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 02:50:42 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5dca468c5e4so4213595a12.1;
        Sun, 09 Feb 2025 02:50:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV+9u3p4uZnGx/0F4r7lum5p2f/qWuM8vJeuLHFYUaY9Wj5wpgcbCDNzmvh1YvLH8mXwhAl@lists.linux.dev, AJvYcCW/WLuPekycEr7J9iUIeL2pVmcTO3OL8fcUT0gfYBsatVGqJ3T/jOWWT9jA9dbsXFxOAbw+Ww==@lists.linux.dev
X-Received: by 2002:a05:6402:a01c:b0:5dc:72e1:63ee with SMTP id
 4fb4d7f45d1cf-5de44feb981mr12484432a12.6.1739098242289; Sun, 09 Feb 2025
 02:50:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250208-maint-soc-apple-v1-1-a7f7337baec0@jannau.net>
In-Reply-To: <20250208-maint-soc-apple-v1-1-a7f7337baec0@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 9 Feb 2025 05:50:05 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9jsvunbpVm9GsQ_wpFUgKyH247AZDmV+p6_=1ZkGvFLQ@mail.gmail.com>
X-Gm-Features: AWEUYZkzBEpN98q4APsDMBtXemAu5dO3ythzUVqUMjRkDuNKl2rdcSvtKwaJNsM
Message-ID: <CAEg-Je9jsvunbpVm9GsQ_wpFUgKyH247AZDmV+p6_=1ZkGvFLQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: arm: apple: Add myself as maintainer
To: Janne Grunau <j@jannau.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	soc@lists.linux.dev, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 8, 2025 at 4:22=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> Sven and I have agreed to share the maintainership for the ARM/APPLE
> platform after Marcan's step down. I'm handling the downstream Asahi
> Linux tree since April 2024 and worked on or wrote several drivers for
> the platform.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f2594c2300f9b054a6d57ce069120df0bb451d88..9987cbc4d14b2d2be43f25968=
8c7791ecfd10423 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2210,6 +2210,7 @@ F:        sound/soc/codecs/ssm3515.c
>
>  ARM/APPLE MACHINE SUPPORT
>  M:     Sven Peter <sven@svenpeter.dev>
> +M:     Janne Grunau <j@jannau.net>
>  R:     Alyssa Rosenzweig <alyssa@rosenzweig.io>
>  L:     asahi@lists.linux.dev
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
>
> ---
> base-commit: 7635a78a95dc3bff39e9c49b34108f81a9bb62db
> change-id: 20250208-maint-soc-apple-8d2498e75509
>
> Best regards,
> --
> Janne Grunau <j@jannau.net>
>
>

I've been engaging with Janne regularly for the past year and a half
as part of the Fedora Asahi Remix kernel work with good success, so
I'm happy to see this for the upstream mainline tree.

Acked-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

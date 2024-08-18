Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8781401C
	for <asahi@lists.linux.dev>; Sun, 18 Aug 2024 07:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723964699; cv=none; b=q8ooek9tLGmu4DA50pl8yjU3P8gHLm4gO2ox0nsQ+IZ0W99IpRLbYVGQCarov6FQRIIszamGuffQFHhfb0+dIdobm6VSu8HX0IAk4Oj2JSRlCnEs/oObDCMs8IXvS/NE+95BhMhI4NoDv9PrqRnoG/ZQ/4sZY3uklR36XWbK4zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723964699; c=relaxed/simple;
	bh=mIrm6vVicupTZRlXUxSQzer2XzkiPaTTLGb8owVkW2w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NH28ziGcV1tQXY3+NCDeyJDV0ZR8dnf5osUcpnUb6iXNDw8wNcZw6hMojsAdkiTs054sx9A3yZgPNih/vbeVny86Zvp2XakhJwC5CvBp27t+K2cWCbUfacB7pOsLbVAiDgeKJlkj6XoISciMaf9CqIsaYBVbNhYIxOqDzIrWKBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5bed72ff2f2so1986022a12.2
        for <asahi@lists.linux.dev>; Sun, 18 Aug 2024 00:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723964695; x=1724569495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r6OkscswnHSoLQc+dDQz+vP2n9xYpi6RMiXpbL1v/jE=;
        b=squQdFLEnSxODYtE7+CTpgGQy8HL+iHj/KGHnZJlNOm+krvsZbSbw6Xull+DI+moO4
         JjQQxFUeQtCllZeNomYbLkdwfju5GE4bPmX6XKprY+T98YkHVm/JNBisDHJYxVFiBQL8
         tRNMPvj6G+qZyjtLeEpCRb10SDe876/azHwKs2FFpJHfuIaaDGuJSkFBLqt7YG2hvMzB
         7t6tLSUurnZx7G+TUEpBAsD4DfY5tr4e+wreki7WWGRflmjyOJfH1vehLaa5YrzaoXNI
         3P96YP82+gCQrVMrffF5oCK35AWcb7imOEwSyIMupkbiAZCboiio+2eLGIO6jW5rVkCG
         MPhQ==
X-Gm-Message-State: AOJu0Yxh8DQ3OLDrr76fZnTWnlYALgV18Y+vykyfYcDBq6is0Fn5M37v
	tRb275EHEDxrgoDl/Uc2zHvBSKhZOsVvqFDibggtUr+oQ2O6tOx4k7kqExfb
X-Google-Smtp-Source: AGHT+IEd+UwtWbyKKq8upOlhW1GoYBwHD9Kz0YgataIP/D5Kakhg6eRcgpNP7LGIZLUg1QInh0l4UA==
X-Received: by 2002:a17:907:f719:b0:a72:8762:1f5d with SMTP id a640c23a62f3a-a8392a11c1bmr505703166b.55.1723964694964;
        Sun, 18 Aug 2024 00:04:54 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cfd5esm489872166b.78.2024.08.18.00.04.54
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 00:04:54 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7d89bb07e7so359833466b.3
        for <asahi@lists.linux.dev>; Sun, 18 Aug 2024 00:04:54 -0700 (PDT)
X-Received: by 2002:a17:907:7286:b0:a7a:8da1:eb00 with SMTP id
 a640c23a62f3a-a83928a993bmr482431466b.7.1723964694394; Sun, 18 Aug 2024
 00:04:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240731125615.3368813-1-neal@gompa.dev>
In-Reply-To: <20240731125615.3368813-1-neal@gompa.dev>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 18 Aug 2024 03:04:17 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9qtud+9uJdratbLmD9EOWPrFh8xn5==-ip_AMZF82Vsw@mail.gmail.com>
Message-ID: <CAEg-Je9qtud+9uJdratbLmD9EOWPrFh8xn5==-ip_AMZF82Vsw@mail.gmail.com>
Subject: Re: [PATCH v2] init/Kconfig: Only block on RANDSTRUCT for RUST
To: rust-for-linux@vger.kernel.org
Cc: asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Lina <lina@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 8:57=E2=80=AFAM Neal Gompa <neal@gompa.dev> wrote:
>
> When enabling Rust in the kernel, we only need to block on the
> RANDSTRUCT feature and GCC plugin. The rest of the GCC plugins
> are reasonably safe to enable.
>
> Signed-off-by: Neal Gompa <neal@gompa.dev>
> ---
> Changes in v2
> - Drop changing !RANDSTRUCT to RANDSTRUCT_NONE
>   (they're equivalent anyway)
> ---
>  init/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index a465ea9525bd..0939486938cc 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1900,7 +1900,7 @@ config RUST
>         depends on RUST_IS_AVAILABLE
>         depends on !CFI_CLANG
>         depends on !MODVERSIONS
> -       depends on !GCC_PLUGINS
> +       depends on !GCC_PLUGIN_RANDSTRUCT
>         depends on !RANDSTRUCT
>         depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
>         help
> --
> 2.45.2
>

Bump for notice... Can we get this looked at to incorporate for 6.11?


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

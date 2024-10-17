Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD9E1DAC92
	for <asahi@lists.linux.dev>; Thu, 17 Oct 2024 17:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729187402; cv=none; b=u21gPLZtJ+lazULhZjJ5Oh4PzMEsrZblAZMiSQrbjrJ9+acZ+WV4hwnxADvD93ohoGqiM9EUHB0dXAmOpbBT+9tUNDY2FnhVjplzEB6Cls7xpAC5L0FFZYMkwhD8/Q43tRGjZ7z3q1IfwFPb4Fm2d5m82/jSgFWLpExtPn22iWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729187402; c=relaxed/simple;
	bh=+Lf3iObRGR3MI/gTOD1+me3xCFYuOFP73NluVCrLeIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ubRF6Vz5p0AEPqU+LmpSDs35F3G41TW8tE/3GmYSD7n7WFUzrMuktx+cO3eNmnD4FaOuwhpmMbFV3dlYAGk2Kwuymj/XS9a0SO5HGyx+RPkz6qbOg1RjUUJpEJh07Y+8vdf9o1MHxkKf411haWaLBzTlm7FN8RSX6NweCxMR+WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9a4031f69fso171182866b.0
        for <asahi@lists.linux.dev>; Thu, 17 Oct 2024 10:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729187395; x=1729792195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCloPbF7r5yRjYTtM6i8/cVXSwmwXC9Un1r2ajxc5jk=;
        b=Ffb13W6aak2UHIWmBVnKBRiXGCBDMNP4uYl9b+Fu85LvI5YMJeHgcsPuUUUWCFI7EZ
         t9TfiORiNw7694FxDjzAfjhceXotZvtESPSbpqbWjnT4Mv0IYeHZIa4Or+kOBjyWtAng
         ODmF5HDUfSiu4NXy9wQnh/R4AijdOkRjfnKic15qPlShKmI0fGQCdwtcMZnTPm7mxmy8
         3F88SzB+C53QvzT9irsfE+aunmggAaLMxE0ZKaKh4D0CIlFpmDV6FcPJeM/qTJ3xZq9J
         RpIJDxZdWQpi4RGyemUZlDziHazX+2BF4hEcHEymyxkuB5rp0BWOS+v4CcdQHGx3k7ho
         inug==
X-Forwarded-Encrypted: i=1; AJvYcCWr+N3ON3psX6q6Pk/Qgo047NwMhffj4w8fGtG3LVIpYOp2bD3sa0CZ/tZy37IPgkNZjijKuw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxqtTV3dzaxXT3/sbon7Exl6jng5CHNFJzM0CrR3Cn4zbApmei
	MrmuB18400Z8khDG6GedVwhCQohGKq9/ayQVTtE1lcFIaiAXikpJY7H32MXyfXw=
X-Google-Smtp-Source: AGHT+IHLNKqsl4MGI1eNysA4ElzuL77MBSnj1GzhpCFbef+XVe3Brr43Yob67sac6BSzx6Z8006JXg==
X-Received: by 2002:a17:907:7243:b0:a9a:5b78:cddc with SMTP id a640c23a62f3a-a9a5b78ce2bmr280631366b.64.1729187394519;
        Thu, 17 Oct 2024 10:49:54 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2974c2f1sm318774166b.87.2024.10.17.10.49.54
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 10:49:54 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a9a2209bd7fso148184066b.2
        for <asahi@lists.linux.dev>; Thu, 17 Oct 2024 10:49:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1kfsQxKsKMSLrJ5mCyJ6YjCC3NQmRzGMv3kuuO14YFiKjKfN9tlOKM6/PfSAp+1+Nw8V4Lg==@lists.linux.dev
X-Received: by 2002:a17:907:f1ea:b0:a99:fc3d:7c76 with SMTP id
 a640c23a62f3a-a9a34e15a00mr754925366b.37.1729187393982; Thu, 17 Oct 2024
 10:49:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241016-cs42l84-v1-0-8d7e9d437d2d@gmail.com>
In-Reply-To: <20241016-cs42l84-v1-0-8d7e9d437d2d@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 17 Oct 2024 13:49:17 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9Oh2WOR7B-LrPOo6C30HH7ENisCKHvTm3MuKiBdswppQ@mail.gmail.com>
Message-ID: <CAEg-Je9Oh2WOR7B-LrPOo6C30HH7ENisCKHvTm3MuKiBdswppQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC: add CS42L84 codec driver
To: James Calligeros <jcalligeros99@gmail.com>
Cc: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, asahi@lists.linux.dev, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 6:42=E2=80=AFAM James Calligeros
<jcalligeros99@gmail.com> wrote:
>
> Hi all,
>
> This patch set adds a driver for the Cirrus Logic CS42L84 codec. This chi=
p
> is (so far) found only on Apple Silicon Macs. In keeping with proud Apple
> tradition, the CS42L84 is essentially just a CS42L42 with a different
> regmap and no publicly available datasheet. It may also be missing its
> parent's S/PDIF capabilities as none of Apple's devices support S/PDIF ou=
t,
> however this cannot be positively confirmed.
>
> This driver has lived in the downstream Asahi tree for quite a while now,
> and gained some refinements along the way. I have squashed most of these
> into the initial driver commit as they were small changes like tweaking
> msleep()s or filling out TLVs, but left seperate a larger change to
> tip/ring sense IRQ handling as it differs significantly from what is foun=
d
> in the CS42L42 driver.
>
> ---
> James Calligeros (1):
>       ASoC: cs42l84: leverage ring sense IRQs to correctly detect headset=
s
>
> Martin Povi=C5=A1er (2):
>       dt-bindings: sound: Add CS42L84 codec
>       ASoC: cs42l84: Add new codec driver
>
>  Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml |   60 +++++=
++
>  MAINTAINERS                                                 |    2 +
>  sound/soc/codecs/Kconfig                                    |    7 +
>  sound/soc/codecs/Makefile                                   |    2 +
>  sound/soc/codecs/cs42l84.c                                  | 1110 +++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++
>  sound/soc/codecs/cs42l84.h                                  |  210 +++++=
++++++++++++++++++++
>  6 files changed, 1391 insertions(+)
> ---
> base-commit: 469819cc17368702a6f68cec2148f518d3f3679b
> change-id: 20241016-cs42l84-f38348d21c88
>
> Best regards,
> --
> James Calligeros <jcalligeros99@gmail.com>
>
>

Used and reviewed over multiple revisions in Fedora Asahi Remix. :)

Reviewed-by: Neal Gompa <neal@gompa.dev>



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

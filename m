Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794362268;
	b=z/c76ahB0aodAzrjn6TtRF2BfOotctNJJV9DicEC5MiPAYKP3s9hUaUmuUnEzsK7kFD/
	 0y7iAhiloNcnZAqRp3rTgkW7F52TGrvUylKAGWz8Zyq170+dYk86TGP3j+g7t51d2rV5M
	 YSo2dQQr8hTxZ76OzJxAP7qpSXALKBiRsjgJovsOG2gTdgAOWQSpryn9Z+MD4I6DV2soW
	 QP0ajTlzoMrpr8ZhSpK30jIum2B9lepHAwe/d2IqPJFt8Cs6AsK6abLADDwI8wkfe90H6
	 W9gefbVFnAUWOGgs/arZdW5MdJ1X0Wv3iwoBIsEAg3DOOPwKo1xFinV+QijrRDU22kQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n14r7j3tiWrKvVPoznKApe6IXK1TKN1rvekMdWEmVq8=;
	b=b4RbHAYqvzLn2IOL57e30iCNrceBaCIqgIXsqMM24xzHchW0qg9HgqvRvwAoYIgfsDj1
	 xodytbr+5aBOfiBUHtS1VjEg5PriLv0qrn9aJdya9tB7tV8Xfxa7TXFD0x5hVO0ssylY8
	 9tgdbpQHGK18Df9TO72uo3ZVXJF2DzTzGAcPiB4nzVEarpIcrCrIoYRBbJDrftMI6jh4e
	 y+FWAK1ejd2rpO97ZKUq62fIC1lPvG5zVVM9bEfZ5EQavOs7H2iedfqZrk2kZBaVbfj3G
	 RB2zjcLsyRcEEe0ygGlzOUP6oO8AO3ElbHAs4dpc5aL5NgH4CaMZQVZ6D2YXYwi5DWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iUdO6ITa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BD6606A321
	for <asahi@lists.linux.dev>; Wed, 11 Nov 2026 01:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40BD6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iUdO6ITa
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67c2c2ac1c3so4095834d50.1
        for <asahi@lists.linux.dev>; Tue, 10 Nov 2026 17:57:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794362267; cv=none;
        d=google.com; s=arc-20260327;
        b=PsCg8aM9vcGVs7xdqpve10WIDkHxNgSmx3Be4z35liG4opJCg9REkCFRLD80+vArX4
         peXBE2aeNRbmMwsK+y01XqJLXRW3AefcV093mwOh3UVl1h7wSTOGbnw+7cPXdPuDQKX8
         mQTy+EWr2Qdimtsq1nRVyCRiLXfgTopKWx9BgUZYrN2B4pib1WCjvE5vOtdLzgLiZ69g
         D+KIuhjAsq376wYgYMzUNiZjnQqYXRPCpO4wOqK1zl6D12wzFK6KXr3vtvJjlTvtemmq
         t3F6IUvQu0SIFJyFuNrLonD0Il270bvaZ3fhaPmzTzQCaJLcV52Gf3vaUdYc24+dJkX+
         8VQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n14r7j3tiWrKvVPoznKApe6IXK1TKN1rvekMdWEmVq8=;
        fh=+Oa2VOg/fBGuO2s67XfTwAKcP3ZFk1Sb/UkC+xOtm8g=;
        b=qV4ewQY7XZfc+Jf4oBNfCDex8GpeVti/FK1uuMdYtZtcsSOwMSwguV0rqFmETKOTNn
         7saHGiFRlFNlfzF3sy4CSDPjinZ+RaYO3MEBwySH/c0VBMr7geDl3GlOZ92z1Q/mfLTy
         QAPDCt4xEoFEiMNQQm4JAXEiecfBFKkimRCMkoY7zm8t5TKRUJDDaFoxYUMN3xgCLysU
         CzLv4hoZLOMpJPqXVH3szLzlQRpDa8DvcTB5ALmAF16IAgYrrpYnDHSIivfpMB7U1CGm
         atrrvda5+k2m4Swly0/0mhlT67Fp/IDjl0QWl80I8oFdOybBuz3OcfKSEZNqCJ4nX9VM
         RKBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794362267; x=1794967067; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n14r7j3tiWrKvVPoznKApe6IXK1TKN1rvekMdWEmVq8=;
        b=iUdO6ITaF1jnJ2AVOqiuNBXQdV0ssj4XcrhebDT0EVMmzoKVyl5A18dNbUx+JpQSWW
         zv13ZhznW+i0uyqM8GKbHmTuheMjn9LsHDMzQ3+ci8UX2Fn9OSxdSIUmG+ynugg22dE+
         P0UJy2OncpZjma62Ofa3+CsJPA7RY/AGm1OTL7fTOzqF1b/6zSAIE3r+fBe/FUvVmQwO
         3GzsSnhu8xc/npWVbgEQYkx/Xb+URYFuzHdbdR4s5CIG2fnAFzSeWofIlNTK8+yWy5Y3
         jPdAqEl4OHg2OuyqjOBQ/JfSuEGxhdvknfMMbePshsyEY7dcUSEBDMvkEK3JOuxS25x+
         PaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794362267; x=1794967067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n14r7j3tiWrKvVPoznKApe6IXK1TKN1rvekMdWEmVq8=;
        b=MRFwGsxXnq1G0McEi1RueoatqYyBBDsEgykTkmsKdmCNUnA958gfdj2UscnXKZ61YX
         NxD/0YxXlD4ui9HCLk0uUlbpLg6Qed43rS2eXXjwbdUEAV27kVSE9f4SrspsJ3kSwSai
         XN4NsMH1FR35fWzW/fxy8QcLI8s1X2EKS6Q4dYB4ztNBydm0E8psWnfFZbvbOd6UFqru
         GJV1ZsHltVjVDWGBzqL7MPwTovCmDcxtdGBL2BNzDRTh9PrNgImTVUlIXToGCceiF6SH
         vQ4Icxf/Fhjw5+6jDWI+5CGHf6wyUaoxEyZYB3ra9GSLCsn9zT6b9M/qxVbnxZrpCb0g
         2dOg==
X-Forwarded-Encrypted: i=1; AL+hErEEc8XX2ss+1DTcRqQsJSKvTacmA32gsjuuuFKDXkT9m9lMpJ6cytwsqljRk7HfUDGTmzdEvw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/3zQ61n+UMpRuHGEUuPECm9Bpi+1hab04euQlde9OtDujL6SNg
	tKuuPgZ1132RyFbDlAdFA/PUGezIMoqFDdgS7TF8EKyXgGulNLvk7RleLNjQK11w1Vk7kql6RHd
	Ls9zlTSFsiCIsnCozMw51BgPy1jo3PMc=
X-Gm-Gg: AYBFou28yxqmyWy90sSUX3wCciA806qYLW8TBYRO4ZVMMGjQNtYga5oRHUmu+2svDoJ
	WvgCbKZMkSn1Ru+Juxe4BTKJ2lff89kyGjCfVoV+cQeJRMsoEe6Hml0ujETHA98nfjySYyJRgOE
	RvmaOFq0KTqqYGD2wMsl2EiAORYRnkf7a7SjGXvRAg1BBeWKDJyOxUF0qWjruZPnIYi1Y9/CEJt
	x+8yat9SOc/Mi23Jl6WaeRgTcYypYIiRZmfKnkiaKavKpB0C53sTctLn5x6g6HJtKYctOJleXOn
	TiO13LZ3QKPqGg1zLUMAPoWrTuF4BOUldY9E3F2aK7JJEWRKiR8sKAQe58IS1GGRP+lYONIGyBZ
	J96f5rpWeCMyfu8t1yc2r221RSFnVk47f63M7QABnS/1cH0Sy0pD0KtWtoi9PPpJG2t0=
X-Received: by 2002:a05:690e:80b:10b0:679:a190:cf21 with SMTP id
 956f58d0204a3-67c67f54906mr653906d50.40.1794362267159; Tue, 10 Nov 2026
 17:57:47 -0800 (PST)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108-b4-apple-mtp-keyboard-v5-0-e2c97b82669a@gmail.com>
 <20261108-b4-apple-mtp-keyboard-v5-2-e2c97b82669a@gmail.com>
 <20261110-accurate-unselfish-cockle-3a39bd@quoll> <CANpmGNufv4_PM=1D1E-KRNQOuCPj8k+sGUJ1Y2HkkAtoSuL0Ow@mail.gmail.com>
 <3b5ac166-17aa-4418-bdb8-c7b9de22b991@kernel.org>
In-Reply-To: <3b5ac166-17aa-4418-bdb8-c7b9de22b991@kernel.org>
From: Michael Reeves <michael.reeves077@gmail.com>
Date: Wed, 11 Nov 2026 12:57:35 +1100
X-Gm-Features: AclHuK8xliRxrSv2YHsVIHXaEDGub-xO05VL_zEYwoOsVKkETettvgLLeJxK-6U
Message-ID: <CANpmGNuQQY-aiorBaNmzyywsVNR0P0NzCXnYweJ9fmkydYO2Gw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: input: apple: Add DockChannel HID transport
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 10:30=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> I would vote for input/hid.yaml
Thanks, I'll do that one. Because there's no change to the actual
structure, I'll wait until the 25th before sending v6, to give some
time for the mailbox / input maintainers to give feedback on the
drivers and anything they'd like changed for v6.

Thanks,
Michael

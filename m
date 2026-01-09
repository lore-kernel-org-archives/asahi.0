Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EAC33B6D1
	for <asahi@lists.linux.dev>; Fri,  9 Jan 2026 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973081; cv=none; b=X6cg0FjUfPl8zE6hS3YIzkmi+qJNaSvHDV5QJQOFamn68oVEg1f50rU0wJtuHzk7It4XOc8XLGl2M4fR5y8YOUg0sN+bm1VtQJ141eimRLmfqtY8r7L0vePlkrWkoMGhVxrRuhxS9saPurBJffUCl/kTln62Mm1s3EZGf8GKhuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973081; c=relaxed/simple;
	bh=4wsaBqi0jtRPnszPM3ogYPTMuByF3Kdlpu042cJzlT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNBMy6h4iUe++7h48gWitTNBCjWm+4XMMQCGRY+yO2ibjNCIgRvp8canvHc9Q2+rWG2Lrj1LGGiX8cEWe+M3TEkivoEtQ7sALtCPR18n32EgH0fN6v0WaWYYIRgoGsxGOPq7NqDhjIBOwIahmwKGVHRqDQUlkBt+/nFBtNDKwgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f196.google.com with SMTP id 5614622812f47-45a815c1cfdso592800b6e.0
        for <asahi@lists.linux.dev>; Fri, 09 Jan 2026 07:37:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767973076; x=1768577876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tDVtzzCDjggnrGIABHuMI1ztRsI4OAs0dlS5olQIsSk=;
        b=SNJ0Uvg34fiub3llxhwHahgfS+lUtMuK4ORsAdBHwL4/QGArkjtQ7xGwxlOzLnQ8tU
         TZt4+YyexeI4PunZVwarCNttg5JGeMSlibYvfkAQOhN+Jz1E1BNkGQjir0MCEcQXW6yx
         NKKLhw9KnazigF+DJrayDkpQBQ4ix9RXEW6/gn452eVmmfJmeExD4onW4MQXb30LDBtD
         6atW4wbaBBUmR7YfOroCfca+A9t2CQqR9ZqUqEiVQM4OEKrI/C+ni84FJ8zQiTIonT60
         xw0z0iCaoD3g6YwIvN+yD74SnEoSIyjxbU8+1f+lUTcBbxFM3tCuNbXigWWivgDMdAOg
         GT0A==
X-Forwarded-Encrypted: i=1; AJvYcCULa55HtxQqy5Of+ZVp2V2gNMaMm1oKK2tCq8wwMvufGZVMecWgbY71xLW7sL558IpY7TmN9w==@lists.linux.dev
X-Gm-Message-State: AOJu0YypxLR13jlHRkTqV8c1+H7llQ5HHmU/lEkkZY/pvTckohVZ8soI
	aTCBRZm9h3XMXRZWLCNy1CQD/wmkXYZahGBFXNDbQiwUQDRIsaU+I/NAyyCGFgr0
X-Gm-Gg: AY/fxX4iuM7cLBUfpwGCAVl9rjrlMJWk9dTGfe+WEhL62nhxFsL4LR57G9kplhomssS
	alGjw7ttHSoFLc1jf4zK7IoJHqjjG8ZnO8F5GW5dq0wRcD3V6t6NXC6gkCW/74RtaU9PU6uc4yj
	vywE62eRQ4ZvfvvBjYMaM7MPpUwJ3oEiaTvLdgNWIynJlU4cK7iK5U7COhx72DdDqVJsQveiEii
	Tt423bcbGOfp46mOik+wDAz3FskB+iTYpnw5ohoAZojnCWU/OvvFhtr0v/gpCl9/+xDe7IOZQlx
	+HAV7HY+s6S731HuCCggGzQl1Rk//aRs6MAR6cuCE/fB1t/2lUBhefsxDG0y+uUTwi/HBLUDg/w
	sXynZxUk8kcWDQ5ChLRGcoY0MgJQg4esw8c6t4LZ/CsFdFM/dYbcgpq8lcdhlGmRuKrCf+TiZBB
	WYgzxGNYpvv9WfrOBBbn7jTGuC3MYA3RdX2jSjxtJ8SIs3hoIr4tVwlgBPcCdeZtTjARtZ6gEC
X-Google-Smtp-Source: AGHT+IFlWdh1QlZZrqh7wEqi3GlHjA6a0a8yJ5x/q/kDQulnwHsq3fi/lgHIuMr0I4HonXgO/hHyWw==
X-Received: by 2002:a05:6808:17a1:b0:450:4782:2b0e with SMTP id 5614622812f47-45a6bdb705dmr5144528b6e.15.1767973076194;
        Fri, 09 Jan 2026 07:37:56 -0800 (PST)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e17cd81sm4873969b6e.2.2026.01.09.07.37.55
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 07:37:55 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7c95936e43cso1694636a34.0
        for <asahi@lists.linux.dev>; Fri, 09 Jan 2026 07:37:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWtVM5T6cbEzQD2ZsFmghvIrkkPsmAgUyT3BbC+KE+O7wuYFemvrs31FPyOf+x/e8F/FyGp3A==@lists.linux.dev
X-Received: by 2002:a05:6830:6601:b0:7c7:827f:872d with SMTP id
 46e09a7af769-7ce50ad0573mr7614979a34.37.1767973074949; Fri, 09 Jan 2026
 07:37:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
In-Reply-To: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 9 Jan 2026 10:37:18 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-4Dycowe8TukV7+suU2pm8yy-G5ukVeBD5=r4PFKo5Lw@mail.gmail.com>
X-Gm-Features: AQt7F2rWXpsz3frhT-_Ey7mmSLoD8jECIUJKTjNZwMNhWrvNHrGDKMFRD2wFgXs
Message-ID: <CAEg-Je-4Dycowe8TukV7+suU2pm8yy-G5ukVeBD5=r4PFKo5Lw@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: apple: Add chassis-type properties
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 10:25=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> Add chassis-type properties for all Apple silicon Macs. "chassis-type"
> is used by u-boot to fill the SMBIOS "System Enclosure or Chassis Type"
> field. User space software uses this field to to determine if a device
> is an laptop. The exact use case eludes me unfortunately.
>
> The Mac Pro uses "server" as chassis-type which is not entirely
> accurate. The tower and rack mount Mac Pro versions share the same .dts
> file and are identical except for the enclosure. I haven't found an
> obvious property in Apple's device tree to distinguish between those so
> both use "server" instead of the more accurate "tower" and "rack mount
> chassis". The latter chassis-types are not in dt-schema anyway.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Janne Grunau (4):
>       arm64: dts: apple: Add chassis-type property for all Macbooks
>       arm64: dts: apple: Add chassis-type property for Apple desktop devi=
ces
>       arm64: dts: apple: Add chassis-type property for Mac Pro
>       arm64: dts: apple: Add chassis-type property for Apple iMacs
>
>  arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 2 ++
>  arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 2 ++
>  arch/arm64/boot/dts/apple/t6022-j180d.dts      | 2 ++
>  arch/arm64/boot/dts/apple/t8103-j274.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8103-j293.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8103-j313.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8103-j456.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8103-j457.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8112-j413.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8112-j415.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8112-j473.dts       | 1 +
>  arch/arm64/boot/dts/apple/t8112-j493.dts       | 1 +
>  12 files changed, 15 insertions(+)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260109-apple-dt-chassis-type-f31523a1f681
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D28F348879
	for <asahi@lists.linux.dev>; Fri, 16 Jan 2026 18:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768589408; cv=none; b=PKfs0+cqqSLd5P77ghCino49qslgpTXFZWbuVk9Y1aGTxSBedY2ogUHyDa/oV1Ln6e5nkSNt9Ryi0s1AKhDiCFRQ4xcMD611FFFThexu6g1fvkwZMfc/ih9UCFG1THtasytEqwd0ofDOczU2fnGk2sX4cnlOUr+1NSp5HfWeE5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768589408; c=relaxed/simple;
	bh=wIFSvs4qxIN2KYyJUK94TjwJvdE0fZ84HYDISM1h+M8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r7jG7n7PR7x/AbMQdCKQjvrrCCXfm5U5KL986k1duHgGnnin6PNGDSeiXbFSB1AZqeOdPTH69jXK8BovKwnXL8VxQ40Fuo5DFMqnhn7L+rETtRf7yH3W00WeUi7Do9CGbNqVSpOfYOuj/SQAMH7oxrPCQdUJHpQct5IkDTWI6Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-45c8b850f96so1442089b6e.0
        for <asahi@lists.linux.dev>; Fri, 16 Jan 2026 10:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768589406; x=1769194206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tdR/h3nDyWvP2R72hsHcMKi/rk0gO3WT3F+Gsv3V5+8=;
        b=wJ635v9h8h8JjBHy1l5eLmjlsj5ESMOdlTallN7aD49t/FeKr1rVFgMWXBG+e5gZbg
         cGaYpkHbgqHLu62NuIAh6g+G/2AYUqXdAZcLljLQCYz5pujU/m6/yy/gf1UAg1aCFQnb
         qFUsy2dHrgkj1SR8Sdvb6DoOyI0jfbMofpJ/ZYSSv7fKL04VYFGk5zaElBZKksM95SVW
         lbLXtGNnGW7EsFWDDLtlRaBnnGXruAj7yIAPAwQVJQ9k6wHv3VOwgD6RxdUIFKwGxRdF
         YIqkDYdgcqhohmrz4OIFIswXUVTEn7rvQO/CVducrUb43KW+jV192DgpHkTMx36aKX+S
         61kg==
X-Forwarded-Encrypted: i=1; AJvYcCUXA9fgqFwQVsUENozYYEI0IdnaguJtKN0+Np0TvapHbZ5HHNLbtvaXDGVM2tJKRgokelDxsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCUPzmw08MALYRV8uNxgH8ElyD5S3rnqYvxPJyiJgWKPhtoKnt
	U8saIHWsymSsvTRW9OeaI7rlZ60escwQHCygr+uc/pw7T05sjV48+NRnM38IEA==
X-Gm-Gg: AY/fxX6GCBXHNRX4wepLPNVBm701gYu0Y1if6JkaJd/+mrMXm5OeHWsZ23JsoUuY5UW
	407DkaP/N/drekeaxRj2HFyU+vJtC63zt4O6tKQ2to1kzi/ym/kHZb0kFbrZ1bSTj/2/qZOIxph
	jck39L6jBx9dyUEqv+YFQk+EovHad/Z6S9xN5GUqPWVM+fQf5OypLyeOyfPBzE+8cm5yW9i2PHb
	J8EhxfKvGXsbybUviWf+R84+kWhZDfei9zgJ5Uu0pc66+syDqBjK7Yk60sl/X2jYBkI8OtImIrC
	xLo1h+Lh1DIApAgE8R/Mw4P/plGaZvQ5/kSLAo3iBK6SrL/MxmYMl7Oc/BBOLFVJSVT79bKSY0x
	7qwK/Kzn8CeiLZuiXb6Mfdu9XmQc6fKfXyU7g6L4pM1m/MFSD7N+rClmEp2aIb83/ycK9Eh8Tou
	lYUguFiluEdawGB9fkjmQuBt+5xwIPBbZOZgjRD2a44nVedUGujE7K4GzupyGfq5Gmw+p74GAa
X-Received: by 2002:a05:6808:15a9:b0:45c:8f03:1e15 with SMTP id 5614622812f47-45c9d871c37mr1348100b6e.43.1768589406091;
        Fri, 16 Jan 2026 10:50:06 -0800 (PST)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45c9dec9ebcsm1659745b6e.2.2026.01.16.10.50.05
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 10:50:05 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7cfdf7e7d19so922034a34.2
        for <asahi@lists.linux.dev>; Fri, 16 Jan 2026 10:50:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV8lFPi5M4Jvpf1EkRvN/vQiLIzVYRdCX+mUs77IG2iEO99U/LTFyq75b8T92z3uPHQYadjnw==@lists.linux.dev
X-Received: by 2002:a05:6830:6c11:b0:7c7:63b6:89d8 with SMTP id
 46e09a7af769-7cfdff80a6amr2215998a34.14.1768589405552; Fri, 16 Jan 2026
 10:50:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260116-apple-defconfig-smbios-v2-1-861d707b466a@jannau.net>
In-Reply-To: <20260116-apple-defconfig-smbios-v2-1-861d707b466a@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 16 Jan 2026 13:49:29 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-UqeGMp+-vQLij=Zux0L9mKL4CZYMYHYbi=kvgjOuUYg@mail.gmail.com>
X-Gm-Features: AZwV_Qih0RhiiYZ5DHz0i73_uJf4prcJ1SgxgrjN6STH7fWjrWSzaqlj2u9btyg
Message-ID: <CAEg-Je-UqeGMp+-vQLij=Zux0L9mKL4CZYMYHYbi=kvgjOuUYg@mail.gmail.com>
Subject: Re: [PATCH v2] configs: apple: Enable SMBIOS / sysinfo
To: Janne Grunau <j@jannau.net>
Cc: u-boot@lists.denx.de, Mark Kettenis <kettenis@openbsd.org>, 
	Tom Rini <trini@konsulko.com>, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 8:50=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
>
> Enable verbose SMBIOS table generation so that user space applications
> can use the SMBIOS table to provide details about the system. The
> desired information is chassis-type to determine whether the system is
> laptop.
> Adding the chassis-type property is proposed for the upstream device
> trees in the Linux kernel in [1].
> Enable CMD_SMBIOS as debugging aid as the platform can easily deal with
> large u-boot binaries.
>
> Link: https://lore.kernel.org/asahi/20260109-apple-dt-usb-c-atc-dwc3-v1-0=
-ce0e92c1a016@jannau.net/ [1]
> Reviewed-by: Tom Rini <trini@konsulko.com>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Changes in v2:
> - Added CMD_SMBIOS as suggested by Mark
> - Added Tom's Reviewed-by: trailer
> - Link to v1: https://lore.kernel.org/r/20260109-apple-defconfig-smbios-v=
1-1-16477009c034@jannau.net
> ---
> I do not plan to update u-boot's in-tree device trees. The Linux device
> trees have almost reached feature parity. The main missing features are
> the USB Type-C ports (on track for next merge window) and the laptop
> keyboards. I think it makes more sense to close the feature gap and
> switch to upstream device trees instead of adding to the in-tree device
> trees.
> ---
>  configs/apple_m1_defconfig | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

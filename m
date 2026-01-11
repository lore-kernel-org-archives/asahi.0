Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4525F1EDA3C
	for <asahi@lists.linux.dev>; Sun, 11 Jan 2026 19:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768160071; cv=none; b=XQqdYSxihOC/faM7dYS9nWZUyE9/1LZl6CA2hss9HFHXVBREWI2VrU1pVBuH6w9kvY2hX9bia05NC8hE3QUkof2UhzB1xy/JNQ2ym9Zpo7OmOAiE9+FSyXTfOIXYI6n9Ss+5QzjzizvZggk7iA2LdUnUP6/sO13AELOaMkcubXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768160071; c=relaxed/simple;
	bh=5dakl8XFKnP2x/+i5fUt1gHxR7w/OUAPoRSxfbl/y00=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hdkTR3+yNnNa8dmzoBx907B84ntAoMzN9RGC4PwQZHlyJf1jjZCJnOkG8OejpLqmtkopukKr/LNkIVgmw3xGLxZcTojpJRX3OiQTEfeBhbyXWytllxSKg9td8ZJxP/97UxAQ+psEwBxBAYj6IPetysY3JFDcxkKlMCp5wfqyXkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-3f0d1a39cabso4118146fac.3
        for <asahi@lists.linux.dev>; Sun, 11 Jan 2026 11:34:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768160068; x=1768764868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GkYn852Tu9q0tPkoFGT8vCSdPljgd8X3NYVvGE1Eo3g=;
        b=jNGu4wA7+0n61kXoL6Bca9dPvj6TbxukLUQMrr6IUCYG3wLKZWVDCG+UFT4CiJGDZk
         K8HiRuI+Q+dbEtd30Sx68YdEvRAcdnCk6lajv715AEXgKrvoRxrZXbj+Yr0wc3RAsmfi
         Zd9pYdFtVV/czZ610Io6r9l4ojMibAWmVoRazN6yyqqte/7cpGdkVceMlhzGLQ/wEW2i
         BLK9wxneBqV9UMz/v3ktCHmZXr9mh809PllFOUBb+HWrF8FXOpRRWfqmYYgsIrliXpQA
         Fy/9MqvXaBNLmlsqYKLsJAVjQiAQmKqvnICWrkcolbXVHxTiN93yxg5KB1F9uTt+nUcL
         9kmA==
X-Forwarded-Encrypted: i=1; AJvYcCU/+gUgWAOLTtbC08VwERj0DBuAQ8D7xjrxa7wzx6lHdaxv3Qt7vKG6GgaYunjxFaGzpNVu+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzGFbs/Bhi2cS6JDP10WE913GnOyPykp5j4tHLmpIV8flItW7R
	s0WUCFW5IifWvmeQWc1/+nXANVmazyNQKo3XrOGcEAPxIDaUB7mrscAu9OUymQ==
X-Gm-Gg: AY/fxX6eRtmZ0GPfa/BR1v1AV55yvBS+8K9s1tWkOQvhsFYqnanohyTt1zAO2gBy06v
	fdxh0BbcX29INVIH2jU0CS60s1fyRRhYrY4ZnlWD2VrioKL0X2j+3YWmcvpqLM+eTvJiNBIWfEz
	++OLkx6mnMxh5gVWGh/6hMe5j9WwcPAlDnQFRhh18GtqAuILnXOpyg6agD3/+HAAnGZme6qTyQv
	JVwWyyat0HGkfUWvurxPuDhHL8b/y5MUUSxwb9HFDOOqW/Lv/J4UvlJtuAI1InQ1MSJGBg3MeR7
	aJUYt14qvRm2aGKyEJC72c5ZAPAfEc6YQX+w5HbW/NXnApb4VCCx8hy09EC8ycsvbrX0STXnVff
	/xLLvhnNdx5+2k/niwD+8j68xl5q3OAFJ+Cb4zKA2W1eL0bf3rdnA4fjpHpY/bqTH/Oe1faXDKl
	70xl9aXdNV4lIeHeDmkQ3bZI46bFTDnaGDtDp5h350uZksRbCU0t+TWdNx4TIjZWu2QC4DkhQP
X-Google-Smtp-Source: AGHT+IGIDwg3xNTKCU0atUU49GydukxIEWWHD0j1kkGQcbOCm16XXu+74eDdQNgcE/f2H2xuCXyRYg==
X-Received: by 2002:a05:6820:e88:b0:65d:88b:c00d with SMTP id 006d021491bc7-65f54f72e3fmr5390732eaf.66.1768160068313;
        Sun, 11 Jan 2026 11:34:28 -0800 (PST)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65f48cb03c8sm6455819eaf.10.2026.01.11.11.34.27
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Jan 2026 11:34:27 -0800 (PST)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7caf5314847so4007649a34.0
        for <asahi@lists.linux.dev>; Sun, 11 Jan 2026 11:34:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWizuKHThbGqD4Rj9umg9hpfmdT+0sZSqfRmM6jVGQmAVfrbTw0/WHGdZi6WK0869sE7VN5Kg==@lists.linux.dev
X-Received: by 2002:a05:6830:4995:b0:7c7:827f:2b6b with SMTP id
 46e09a7af769-7ce50bfdec9mr10107663a34.38.1768160067563; Sun, 11 Jan 2026
 11:34:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260109-usb-dwc3-apple-compat-linux-v1-1-b6e255b5e5af@jannau.net>
In-Reply-To: <20260109-usb-dwc3-apple-compat-linux-v1-1-b6e255b5e5af@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 11 Jan 2026 14:33:51 -0500
X-Gmail-Original-Message-ID: <CAEg-Je8EMWmwyMMXM-82PbXvLKdxUz9Jxus33dxEAZ8eRRxz3g@mail.gmail.com>
X-Gm-Features: AZwV_QiswhMQh-OfNIc-ljra59Z6BdVFFswTCuHhAUK8Tp-IsA-zsBu1qCLV9X4
Message-ID: <CAEg-Je8EMWmwyMMXM-82PbXvLKdxUz9Jxus33dxEAZ8eRRxz3g@mail.gmail.com>
Subject: Re: [PATCH] usb: xhci-dwc3: Add "apple,t8103-dwc3" compatible
To: Janne Grunau <j@jannau.net>
Cc: u-boot@lists.denx.de, Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
	Tom Rini <trini@konsulko.com>, Mark Kettenis <mark.kettenis@xs4all.nl>, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 2:41=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:
>
> The Linux support for dwc3 on Apple silicon SoCs switched to using a
> apple specific glue driver [1] that uses it own compatible string. The
> glue driver handles platform specific requirements on the interaction
> between dwc3 and the USB2/USB3 PHY and reset-controller for USB role
> switches and plug events.
> To keep USB working as before when the nodes still carried "snps,dwc3"
> as compatible add "apple,t8103-dwc3" to the of match table. Eventually
> it is probably advisable to add a dwc3-apple glue driver and write code
> for the currently empty Apple Type-C PHY driver in phy-apple-atc.c.
>
> Link: https://lore.kernel.org/asahi/20251015-b4-aplpe-dwc3-v2-0-cbd65a2d5=
11a@kernel.org/ [1]
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/usb/host/xhci-dwc3.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/host/xhci-dwc3.c b/drivers/usb/host/xhci-dwc3.c
> index e3e0ceff43e6abdb8643f265819eff28c2c802f4..ba42c3247654b7d9272c42ea9=
c4cf0bd9082915e 100644
> --- a/drivers/usb/host/xhci-dwc3.c
> +++ b/drivers/usb/host/xhci-dwc3.c
> @@ -238,6 +238,7 @@ static int xhci_dwc3_remove(struct udevice *dev)
>
>  static const struct udevice_id xhci_dwc3_ids[] =3D {
>         { .compatible =3D "snps,dwc3" },
> +       { .compatible =3D "apple,t8103-dwc3" },
>         { }
>  };
>
>
> ---
> base-commit: 127a42c7257a6ffbbd1575ed1cbaa8f5408a44b3
> change-id: 20260109-usb-dwc3-apple-compat-linux-821ee75bec48
>

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

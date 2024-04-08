Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBCA3BBD8
	for <asahi@lists.linux.dev>; Mon,  8 Apr 2024 08:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712564861; cv=none; b=PouipoSXPNNnp4jfyKW5vVl3wm3lV1uNrv+j6KWIWulEjDq666qaW0TLlvxEs0YWQY08BkNPWEnJ/QlHVSp1osIsM7TpJIp2vbUqKRgMtu41ezRTWAXPjgAJFFcfLAp33inK6poKXS+3l/zkSfMCF7GZAILESVz+QGlYNqR9YGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712564861; c=relaxed/simple;
	bh=u9L7qVa0ZjLHzku/GRWHHqefATdqWRrHJlXyyocla8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eOoV4iXCFAbJlOwaS2Tjdpg1OjsKRnKmOVzzuVz6AwKUWzYmUJmLoY7QKbiaXfOMLHReLSBpNIlUp88rNpVYDouB39Qm0euw8QR7phXLcM865RMmZqlgG6xAjH7RJb0srkR5UZ4xzzMJRPtHOHtH0tRB2RzTW03MZb5infotxRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5aa16c0583eso1077432eaf.1
        for <asahi@lists.linux.dev>; Mon, 08 Apr 2024 01:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712564858; x=1713169658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mduMjCqjA7drDw2lEIoqwW5oGXEwTzrsNz9VmuPIKQw=;
        b=Houg1nI8KqOMO83WwVrEKDbDtlea2XHnlz7P+4Qv571mIy0Fh041p0nleGepdOcvdn
         +Yq5pVunqPhlUBYmPrcAhYfSgmNjBOaohDKXpZ5LnYRQ3W9hCr3T2CDzHFtEQLLWJiIy
         rO0/eRdaQD861Dre8e5RpXzABpwJI14GC9wwkdf8Qbp1ah2nVpqVpFpU9IRPeLxS1zrM
         bAp4QqD3g0XX1I0pe40HR3dcQtmWed9C2nBpp0RKg+TNYjStceq7T2k+Z26RHilCrQgf
         Kvamr8TxsNb/72fmPJxFIKTnuaCNBKwWItr/Fa/8bzXkRt75HlQ4UCUcgRDvmcILoZAp
         a2Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVnnfSq9fW05yW3vmiLfk9hO2wOCv+F1VyEypb7qf7gIboxgG8l0UYYNTAhXpeg7EC2wQWADptQODFhHwxT4mM1cu+VPmU=
X-Gm-Message-State: AOJu0YzMCfo45QLBtkAyzDJvqO59s9m/GEt44jmYDvxqRXEz/ewrYXKh
	oWZWuYDNi8ELtt5LUN6wmfbf9/uUjRp086Vk7ynSsAkNseBIztaxNYRE2amg5yM=
X-Google-Smtp-Source: AGHT+IG4a3rt0HajZknTq5Pin5SVsASgRAwC14zo9JkFQokZ7a/0ocly02OKVtmPYiBXfub5KyRK9Q==
X-Received: by 2002:a05:6358:968f:b0:184:69c5:c076 with SMTP id o15-20020a056358968f00b0018469c5c076mr10007194rwa.30.1712564858418;
        Mon, 08 Apr 2024 01:27:38 -0700 (PDT)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com. [209.85.216.50])
        by smtp.gmail.com with ESMTPSA id q5-20020a634305000000b005dc9ab425c2sm5933642pga.35.2024.04.08.01.27.38
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 01:27:38 -0700 (PDT)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2a07b092c4fso2976564a91.0
        for <asahi@lists.linux.dev>; Mon, 08 Apr 2024 01:27:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYdS6JFN7PRoXANWEKaWx1uj0FWl0OAYuhJaTXV3xUNrOr1Fx9RXJLbIK9C/yeuxV1XgFyJUB6F6wW/IFDEcXq2nHcbCQ=
X-Received: by 2002:a25:7406:0:b0:de0:e7f2:a03d with SMTP id
 p6-20020a257406000000b00de0e7f2a03dmr2539436ybc.3.1712564836998; Mon, 08 Apr
 2024 01:27:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240407102000.37213-1-krzysztof.kozlowski@linaro.org> <20240407102000.37213-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240407102000.37213-3-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Apr 2024 10:27:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWjWLdu9c7=OhFLsY+jSZXspb6jPHxVai2GcbJoS7MDLg@mail.gmail.com>
Message-ID: <CAMuHMdWjWLdu9c7=OhFLsY+jSZXspb6jPHxVai2GcbJoS7MDLg@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: PCI: host-bridges: switch from
 deprecated pci-bus.yaml
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Will Deacon <will@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Srikanth Thokala <srikanth.thokala@intel.com>, Ryder Lee <ryder.lee@mediatek.com>, 
	Jianjun Wang <jianjun.wang@mediatek.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Heiko Stuebner <heiko@sntech.de>, Jingoo Han <jingoohan1@gmail.com>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Tom Joseph <tjoseph@cadence.com>, Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 7, 2024 at 12:20=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> dtschema package with core schemas deprecated pci-bus.yaml schema in
> favor of pci-host-bridge.yaml.  Update all bindings to use the latter
> one.
>
> The difference between pci-bus.yaml and pci-host-bridge.yaml is only in
> lack of "reg" property defined by the latter, which should not have any
> effect here, because all these bindings define the "reg".
>
> The change is therefore quite trivial, except mediatek,mt7621-pcie.yaml
> binding which have children nodes being also host bridges, apparently.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

>  Documentation/devicetree/bindings/pci/rcar-pci-host.yaml      | 2 +-
>  .../devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml        | 2 +-

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

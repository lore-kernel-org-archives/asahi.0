Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52B72375F
	for <asahi@lists.linux.dev>; Sun,  7 Apr 2024 12:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712493550; cv=none; b=GZwvBr+QwksjJOD8XLnBptrlp/xHnU7/9dlbKWT8pyywCgCa+h48TcJlmyZjSV+NuCBP6adgNqBOTPAOraMNAQ/aLvn/YNIyJfwuYQXyQZoIXDpuMGL3J9E6+dg193QXxJUtYVd7eZo8W3JhzQfYECtx4a9AHMin26nN96eLzjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712493550; c=relaxed/simple;
	bh=70uywmOjnhBrYkTEuZzo/N9wDcHw5Nb706IWaY5ySNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sp5qN9YPUSRPjhbIlOsjY0j/HR8iuGGrXjA0GXxnBIYiH2Lpn6ojMVHFWEc4uYs8CeWgRA3z3OjDVUeZa1q5Fb/rasOm3Hengsa+Mub+heeu934OX2CzUYu9CO9l2/UHt9EmF5ltxQzskokHKbAGku9sJkt/LzjUzRlvs2JuSck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCSOfb7p; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCSOfb7p"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5aa2a74c238so389499eaf.3
        for <asahi@lists.linux.dev>; Sun, 07 Apr 2024 05:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712493548; x=1713098348; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YinWXQnk0eT7Z1wHOzuPSCSYvlwXIPlk1+iKh10Vls=;
        b=aCSOfb7phoeiYYc3Ch7oVINojjVz6YN80QQkrCwpX6RWf16yYto5C0YjyvdE0i/Ebb
         HiiahKanKm6dh8olxG3tf7TCFQIKoog8HhAZDolqDfPf1IsxUIKr0Lj/wqqeBmeDBd48
         69lqv8fHWpKVm+4xjK9tLWLMCIvYzQaGG0V4XRuOzZZTThC2j1Zkn5LVq6CWd3i2V+PS
         TICmWEURyX0utwpnkseNEK2yzN/ZJ6TlQnFp3PwZcWmLuFxWZ7pgtt5wolzlkuVpuJ20
         tx9YNeVFSqG7WjJ7ht4zjTVw6ZL/v19XqsEvwZYZmTrt6ngvjvaQfoOegV/HK4Nm0luN
         GgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712493548; x=1713098348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YinWXQnk0eT7Z1wHOzuPSCSYvlwXIPlk1+iKh10Vls=;
        b=RyYWDmOJhJuKzzjHbJ8UNKlrec0RV6pYupCCx/t+7es03vXxf94/TIWwsfmuGAj12H
         WgzzS5rdDMsY7SIULyuq/AaKG5fUi2x/JGK3BPZo/DDFvGRgN7piF3Tw+okfY+f0rLJu
         KJSsCq0uIbDRY4n6wc+lYS9INJdcRoY12zhvY/45MaZZMiNQiqLoU5ZSuaoxRm+DBe0/
         +qPNGW0VjwTo9U9LSPVjKlY+76BUTgI1Vmln2Sf/X2qGitRtBACYV+nlh+uRagy9SKeO
         UGO0Ri2fbVzS6efnvt+tX9jGLdx+tWIKozrIPwfx7Fttblm84dSDO3cByk/+1SiA9MhF
         8qCw==
X-Forwarded-Encrypted: i=1; AJvYcCUnA1wVTfEVUywCFiVlwj79nNid4PtKbHqPf10d9hCYL1h8LSJcRssCIdu7iBjd9zK6/A+eZw35iL0C6Utio/OX/QVjTHI=
X-Gm-Message-State: AOJu0YyFXc8By/ecnl58L43NdxWtuiBMVAxKTrK1lLa5kz5aIuAQi94m
	368iI4ZdP8ILJDz5y1NUGggPjZVB3bL1Pq+OPNNOXqk0IjrOzZwiga95mEfMnU5eyaOefTAQrFy
	Sn/NS6w5HKG1nX8pd2FLVLZCnJog=
X-Google-Smtp-Source: AGHT+IFvZ1UMHhMwBSNso145G9wXeopvnhz67bSYiVC6v0RYNhkx43Ef5CmXFgL9Iup+iSFrwPTE4vACd2zsBUdljvU=
X-Received: by 2002:a05:6870:fb8f:b0:22e:e1e5:b8e with SMTP id
 kv15-20020a056870fb8f00b0022ee1e50b8emr6777731oab.41.1712493547737; Sun, 07
 Apr 2024 05:39:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240407102000.37213-1-krzysztof.kozlowski@linaro.org> <20240407102000.37213-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240407102000.37213-3-krzysztof.kozlowski@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sun, 7 Apr 2024 14:38:57 +0200
Message-ID: <CAMhs-H_gx0LB89QpLf-fJrumONRSnwB5_L7YkkWKC=7130EFLA@mail.gmail.com>
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
	Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
>
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
> ---

>  .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml         | 4 ++--

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

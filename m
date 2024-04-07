Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD114C7B
	for <asahi@lists.linux.dev>; Sun,  7 Apr 2024 12:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712493382; cv=none; b=ILV/o4qXsI/CQ8ZtNvogI6qS8n8hL40JkFQqEI5lBmZZ+RqxGRzZu0Lyg90QYeptTIRjRZJ29FDUTXZbR9ByMnZTfoYxzpgZugVW+L3wU6jgN/wXjkdXnu3m17iU3UI9duQtfycjOR+vgYjuwsOfrC+2QU+IRL/q4WjPVVI3p4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712493382; c=relaxed/simple;
	bh=VhtheWqyCFUO49/ez9JKbY6OihTjwk/bQeNzjLVwE5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKWwcSFCyVMdAloaO8bXBlFv6XKi2OEaE7PFmYiP3gUOgZGDKkYjaAa4jbsFlhcrJhrqsRuK92e3OeWIwcP7vhDTc5b47rI2tYnJXZphI8QhSqkn9X5goNoIMQWsmZaJfnaB6JCl31BhFyj3x7qqVvvgoBtw7gYeIwFKHPBGNr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVLupGFe; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVLupGFe"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-222c0572eedso2290076fac.3
        for <asahi@lists.linux.dev>; Sun, 07 Apr 2024 05:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712493380; x=1713098180; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTpah3z9nxK4+QUIUhM/zsRbPjioxiMre0R2YErPMBI=;
        b=HVLupGFeF6KkazZoy5pNAURRuRDm71qzQzXFRfgH2jykYlA7yn6q4hjghmgWbdYAM2
         Olvr5p+BD8ZjO8Wr3blr16A/t/jiSa1tu6wiLRa/OOTVHiIiVZFq29MznI9oOdiXr63q
         MnAgD+9jnW3gEhcvlxgTnVOVnErYWLjwziMOxR08AUVzrF+cCVnPhEfZvZ3zSI2Zsk86
         nzmdUvYtdZTdwzE+++BE+udDuT5oyL9+2Q/vIFh77hLdea8UcfbTA5UN9dgJohKz6r+j
         JXHaWvOOmCjWW0wcUf+vT3xLz/Rvc7VX5yhLYUFrgWiF4lvl+KVjOdhBkxuEJG2K04h3
         NBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712493380; x=1713098180;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTpah3z9nxK4+QUIUhM/zsRbPjioxiMre0R2YErPMBI=;
        b=vW0439aFkLrIw4hRMlQFehnpgjWMrKKXuznlwAygmDXTijT4LwqcB45WRYyE6Y+fFC
         OwD3yrBJNxB6v6SB0fvU2bMtrRiom4P1xSkqRVZ7CmWfnGQS+kyPcd22N05AZeAAfJNX
         snX9me56rrJ7YXDWjny/0za41PrzdY8jvfzPjW11dHqHjo1Tv1VosxmB921QYSIWUvQA
         gLPlY7tS6yMCaDohG8t417+wDkTy+YvPxmTIW5wmX83ZvHFJosvDAZCjmoRZcva8r2hF
         ylPregg8qTRZdISBWvcQYXLDiImr2WGSpogpiro3TfGk4/WhDRIE43X/5yKVLov3LgPs
         WARw==
X-Forwarded-Encrypted: i=1; AJvYcCXlEkfE0j0dY6RgWSuMIlpxGKDLOTqZ8uYIK4Yh9Rb4zIZ+JieoIK1H3DakgdpSUFHXJb7+m1Exs/xc8OdK6qNobALcN7c=
X-Gm-Message-State: AOJu0YwDa2j0B1em0g6k46B5PbZwAK+CykH0rNveff+ZO2D+vBGxP4xJ
	Ucy8hWYl8lti6QQs/4Xd/hYIEtpCPbIL0NKEDyVO6IGZ2ZQyezmUqnCX1m4IMx1BpXL/UYg7yJp
	XWu4LzMOWl4iSVbbWKDXRsmpOfh0=
X-Google-Smtp-Source: AGHT+IHCRJwJiztaVGgYDsbvhsWKurdYA7ka/A/XrCbAAgdQQF3HjScy5xiyJE6CEank6R3QWX9EeoxlvmFNctyZZ+w=
X-Received: by 2002:a05:6870:d622:b0:229:f9fa:df52 with SMTP id
 a34-20020a056870d62200b00229f9fadf52mr7031792oaq.12.1712493380515; Sun, 07
 Apr 2024 05:36:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240407102000.37213-1-krzysztof.kozlowski@linaro.org> <20240407102000.37213-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240407102000.37213-2-krzysztof.kozlowski@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Sun, 7 Apr 2024 14:36:10 +0200
Message-ID: <CAMhs-H8jjPpoFfUngpCckAq+hix65VN4rNWMJb=Rrtkzq6nEKA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: PCI: mediatek,mt7621: add missing child
 node reg
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
> MT7621 PCI host bridge has children which apparently are also PCI host
> bridges, at least that's what the binding suggest.  The children have
> "reg" property, but do not explicitly define it.  Instead they rely on
> pci-bus.yaml schema, but that one has "reg" without any constraints.
>
> Define the "reg" for the children, so the binding will be more specific
> and later will allow dropping reference to deprecated pci-bus.yaml
> schema.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml          | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

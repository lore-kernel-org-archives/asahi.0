Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB0213CA86
	for <asahi@lists.linux.dev>; Thu, 11 Apr 2024 06:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712817442; cv=none; b=ZHISVD2x42YF0/DKPpa6TERoONJvWW81FXoz14C/C3Q2XZeUiNPyGZWkcZkGGvoPIhpQg34Xogybfmbjgnx0E17hS3HZxyH1aBX0SYE6lCgFxdIB54nsj0qcUJNuqParG9i9HkvvF2T5V3hFgEMRitMpsr1PxYjsLENwGt17BVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712817442; c=relaxed/simple;
	bh=2ipZN9n0TtN3o+SfMKeB61oRs+EH1yEZUxvjc7CAjrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUGrpRgybC8TRRXF5cF9vq1WTKPCoad89chTkxxGotryrmMmhu1tlAGxCmQYv+BrgUfPFqLBVqcl3fbVL/20pYsFC9f0UOQypIT0HWrAXGuoqKj4hIVUZD0ZrLaenkHAYuN3PmC/mO8kKnfU3iCPqAvyeYsbOR2yyfCUfr2F98E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ea9FQBMU; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ea9FQBMU"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5aa17c29ba0so2829389eaf.3
        for <asahi@lists.linux.dev>; Wed, 10 Apr 2024 23:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712817440; x=1713422240; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVtF0FbxwDL1+EyVXXt8m5PuumkGURWxInjDGKcvjBg=;
        b=Ea9FQBMUI+WNsZINVx5C02k3z4KJ9xR5S2t6PoCj6iWtGaQqPs3jlSdSQRDLtMjxhz
         rS2+7n4PmuErKI1IWuBNMk6vQlIM/2/l1YWDhCZIgck9vfDO5tj0kCz/8XYzBhNlP/TC
         8/n3HcROcSUNYmIEbZldYO0MlpL1i+IAa1cYrYtb+qXZXBkbPAe5xrfM6SO8w8ZZyKmO
         zxYcSn+cXw3xJnL/nlodWPR83teH6EpKoIxIyQFGlWUVtgQeqLc555QsYXdQv/QlBJDD
         ps6ASz65FrplqmV6agi8PqSmjDSZvOIglDzbqZrPUTcswFMdDxLyObNjiZ1oyoPyZ5uw
         MZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712817440; x=1713422240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVtF0FbxwDL1+EyVXXt8m5PuumkGURWxInjDGKcvjBg=;
        b=IU7MzoJdElbZKLY58q5I2ilVNYEz9PSK24WbixewO2afI86zq9rS/NBc3IF2rtXTXe
         JM22/Yq5apDfA6X+Q2KRShcFSu8eR79XvpiMka4UCpEOWllmHXYh4C1PYxS9XFLghiBc
         lM8SM5TPXA6mVlNZQq1MOwk+pnFNAF44ReRPLyNJubdgP9KVjMefCCmkfW2nscm7eT88
         /b6eDq/aZnoZXf5wF8KqeXlwebw0HpTbhhKtt6+vRtqEPKdN6sxBvYrV52/n1FQ4CZHz
         DV/sOL/AsbhWf0gZkhH22evofaNHV/Gf/kRvlzGEGBCE4Xam1QVdeRLhTNq1gjLtEj3R
         FqRw==
X-Forwarded-Encrypted: i=1; AJvYcCXIoRjh19dvcmHXNGTAwJX5CA07hsp0PWP55lhUT0FqYkSgU8qQAScC2p0rsNPmLLnye00kbvUMC9yz6FYJ6pTnTBs1ATg=
X-Gm-Message-State: AOJu0Yze2vUgdqqQVZOr1Ucd4/0psHJMIGeC/jBat9Ao3HLgwcZhZufG
	xSSEfbahDM2R850Y+rP5lB2QR9zudm0QxOx8oWAvHymyFSGZlmZzAchyQRmkf3bNlMTvDVbJvDA
	5eUZ+dNTHoD1aP/hemAH1tvIsuMk=
X-Google-Smtp-Source: AGHT+IES9majFVr22VozspwWyOs+YbISGsgQi1H0N7wgH6XHm1MFch0WdzdzAv98JrRwXB0nazk545ZDOwQPlvcyYH8=
X-Received: by 2002:a05:6870:55cd:b0:22e:6b4e:d2ac with SMTP id
 qk13-20020a05687055cd00b0022e6b4ed2acmr5468350oac.12.1712817440529; Wed, 10
 Apr 2024 23:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240410212638.GA2159326@bhelgaas> <458ce909-0616-487d-b4bd-42b58d059198@linaro.org>
 <CAMhs-H82Ymc=isxu6AX4_s1QnNpSSNt74--ED1j7JxpzE=eCRg@mail.gmail.com> <0336b752-ba98-497b-96d0-efc01ffbd93c@linaro.org>
In-Reply-To: <0336b752-ba98-497b-96d0-efc01ffbd93c@linaro.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Thu, 11 Apr 2024 08:37:09 +0200
Message-ID: <CAMhs-H_yWFn7JvCYhVqELmBjwHO8KCU_UVE5XTas2WVJC1UsAw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: PCI: mediatek,mt7621: add missing
 child node reg
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>, 
	Nicolas Saenz Julienne <nsaenz@kernel.org>, Will Deacon <will@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Srikanth Thokala <srikanth.thokala@intel.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
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

On Thu, Apr 11, 2024 at 8:20=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/04/2024 08:13, Sergio Paracuellos wrote:
> >
> >>
> >> I think the question should be towards Mediatek folks. I don't know wh=
at
> >> this hardware is exactly, just looks like pci-pci-bridge. The driver
> >> calls the children host bridges as "ports".
> >
> > You can see the topology here in my first driver submit cover letter
> > message [0].
> >
>
> Useful diagram, thanks. It would be great if you could add it to the
> binding description.

Sure, I will do it depending on time hopefully sooner than later :-).

Best regards,
    Sergio Paracuellos

>
> Best regards,
> Krzysztof
>

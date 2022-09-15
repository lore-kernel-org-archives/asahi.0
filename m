Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0704432
	for <asahi@lists.linux.dev>; Thu, 15 Sep 2022 13:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A37C433B5
	for <asahi@lists.linux.dev>; Thu, 15 Sep 2022 13:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663247376;
	bh=voBOspV7bMcyAOeL4IXlWZdmHt1ofLGAWeFr9pfd3M4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mwPCw60Q/FaLbJtDCeVQ+MGRtjz5+Mg3watBFhaPlRpSaXCc3yw72nTHSNnuU4LXd
	 44mZUcEdoOA4t+xQ4jHx1IrH3bj3XbDL6YCRheg2v526vnaUXKddXY1wcr2sTcqEFH
	 CJuA2ARstHd3yBic3yIdb6L3kaoRDFNDJKEnBeB7i07VZtuHrUFu9YYERPHQva0boE
	 p3sXDVmKjju/7nXZsrkv7Qfn5JCrppjIQ6BWReK4v4dmYLXt3xR7sQOvE51EPfqm8n
	 ANtzLfHvnq1RuwnQDuLCG5glf/gxR4hVnwcJh0DAMQnvVA45eb00SJ0QtRh6rhCduS
	 ztDi6iTo3rjWQ==
Received: by mail-vs1-f51.google.com with SMTP id u189so19229331vsb.4
        for <asahi@lists.linux.dev>; Thu, 15 Sep 2022 06:09:36 -0700 (PDT)
X-Gm-Message-State: ACgBeo3PBmYBznc9kOEFhQV6VTSIJmIuCmOCdNOj6uAqN+q7SN9NvDUb
	EV6fMH3nEUwaNbSnK8WMQim5pep3ShMO///mXw==
X-Google-Smtp-Source: AA6agR4BIfzeSUOkNKwBmMYoVvW5yb/Z1HSv0FwqqEWLBeGrUkIu+Mdpm6vlUlMr86ifsZh2UV/yNNG8p8uNEyrklF0=
X-Received: by 2002:a67:ad12:0:b0:398:3d57:33e0 with SMTP id
 t18-20020a67ad12000000b003983d5733e0mr11010446vsl.6.1663247375551; Thu, 15
 Sep 2022 06:09:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220907170935.11757-1-sven@svenpeter.dev> <20220907170935.11757-3-sven@svenpeter.dev>
 <bcb799ea-d58e-70dc-c5c2-daaff1b19bf5@linaro.org> <20220912211226.GA1847448-robh@kernel.org>
In-Reply-To: <20220912211226.GA1847448-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 15 Sep 2022 08:09:24 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL96Er9JuDajHWtf=i7bvzrf7PLzk-G-Qm4wTxTr5BStg@mail.gmail.com>
Message-ID: <CAL_JsqL96Er9JuDajHWtf=i7bvzrf7PLzk-G-Qm4wTxTr5BStg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: net: Add Broadcom BCM4377 family PCIe Bluetooth
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Sven Peter <sven@svenpeter.dev>
Cc: Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Hector Martin <marcan@marcan.st>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	"open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 12, 2022 at 4:12 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Sep 08, 2022 at 01:19:17PM +0200, Krzysztof Kozlowski wrote:
> > On 07/09/2022 19:09, Sven Peter wrote:
> > > These chips are combined Wi-Fi/Bluetooth radios which expose a
> > > PCI subfunction for the Bluetooth part.
> > > They are found in Apple machines such as the x86 models with the T2
> > > chip or the arm64 models with the M1 or M2 chips.
> > >
> > > Signed-off-by: Sven Peter <sven@svenpeter.dev>
> > > ---

> > > +examples:
> > > +  - |
> > > +    pcie {
> > > +      #address-cells = <3>;
> > > +      #size-cells = <2>;
> > > +
> > > +      bluetooth@0,1 {
> >
> > The unit address seems to be different than reg.
>
> Right, this says dev 0, func 1.

Actually, the reg value of 0x100 is correct. func is bits 8-10. dev
starts in bit 11.

Rob

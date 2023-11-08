Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3FD18F;
	Wed,  8 Nov 2023 16:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3b5714439b3so3413252b6e.3;
        Wed, 08 Nov 2023 08:40:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699461614; x=1700066414;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ssuYxHfN9GAnFK7fIA31znw/q0iB6aLpzguCXmB/ycM=;
        b=heuvM3TUGvftOhOhrh276Pa2sR9EOtiRSdA1HUe4SjzTccxgo7CFo/Bq1cxGRw/5ln
         fm73IdBSSgsWwkEWOMCstcAwks8aR0tXNJ8ssjsy/secUoozPpNC8vx2I+A6MAAmhzt/
         7Z8fMhOKmm91GvDtfFyjEm9a9Sw4DMudUr6EbtckL30La1/6KAr3Vh3Sg86XCUlETa8a
         u63d31dDXYf+Mq7vJ//fIABUT+ha5pYNICswJI6IfQ2w7IkopmppmDGRjUc0X46VljbJ
         OKJ7swE3RL4O43vJJePm0c/LFR7WsQXHoudYDj7duMzP/EdGRvLj0T/7ci4kX4uta4u2
         wzVQ==
X-Gm-Message-State: AOJu0YwIT7lsbu1RinhC9IXLVauYYwx9gGtQmN1E3sqsaxTQOCDElBxT
	E8CUkcDU+7jpHQ/FewZHPA==
X-Google-Smtp-Source: AGHT+IGXYQ4NWuhknPwkgNGSEQUWD6c5qRqqAmhMQTB6tTEvVpofwZw28IPC+YMCrYLivbXk6k+J5g==
X-Received: by 2002:aca:905:0:b0:3af:26e3:92e with SMTP id 5-20020aca0905000000b003af26e3092emr2345076oij.28.1699461614688;
        Wed, 08 Nov 2023 08:40:14 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id bk31-20020a0568081a1f00b003a7a34a4ed8sm1940758oib.33.2023.11.08.08.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 08:40:14 -0800 (PST)
Received: (nullmailer pid 2362820 invoked by uid 1000);
	Wed, 08 Nov 2023 16:40:12 -0000
Date: Wed, 8 Nov 2023 10:40:12 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Julius Werner <jwerner@chromium.org>, 
	Evan Benn <evanbenn@chromium.org>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Maxime Ripard <mripard@kernel.org>, 
	Oleksij Rempel <linux@rempel-privat.de>, Justin Chen <justinpopo6@gmail.com>, 
	Baruch Siach <baruch@tkos.co.il>, Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Marc Zyngier <maz@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Jamie Iles <jamie@jamieiles.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: re-order entries to match
 coding convention
Message-ID: <20231108164012.GA2336524-robh@kernel.org>
References: <20231105184154.43700-1-krzysztof.kozlowski@linaro.org>
 <300293570c0d29d5d4a39762121b5bef@milecki.pl>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <300293570c0d29d5d4a39762121b5bef@milecki.pl>

On Mon, Nov 06, 2023 at 09:10:44AM +0100, Rafał Miłecki wrote:
> On 2023-11-05 19:41, Krzysztof Kozlowski wrote:
> > The Devicetree bindings coding convention, as used in most of the files
> > and expressed in Documentation/devicetree/bindings/example-schema.yaml,
> > expects:
> > 1. "allOf:" block just before "properties:" (or after "required:" for
> >    more complex cases),
> > 2. additionalProperties/unevaluatedProperties at the end of the file,
> >    just before the examples section.
> > 
> > Re-order few schemas to match the convention to avoid repeating review
> > comments for new patches using existing code as template.  No functional
> > changes.
> 
> It's surely going to help a bit but for a long time solution maybe you
> could consider adding proper check to Rob's bot and/or checkpatch.pl.

I have such a check I wrote long ago. tools/yaml-format in dtschema. It 
just does a ruamel read and write back out so you get exactly how ruamel 
is configured or defaults to for things not configurable. Primarily, the 
non-configurable part is multi-line text without a '|'. So lots of 
'description' paragraphs are reformatted. It ends up being too strict 
IMO.

The key order is checked, but not fixed. Probably could add reordering.

Adding this by default (and to the bot) means fixing *every* file in 
tree first. That's not something I care to do and enforce.

Rob

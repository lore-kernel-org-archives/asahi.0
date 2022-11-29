Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263673214
	for <asahi@lists.linux.dev>; Tue, 29 Nov 2022 23:30:19 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id q186so17006459oia.9
        for <asahi@lists.linux.dev>; Tue, 29 Nov 2022 15:30:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Cubshc49cfUySOoKGcznuCahjy85fYWeWeknC7r/cQ=;
        b=OA9UouFLjAH62mXTvPjzfuaWF+Loa3lF0wjP3XYeNy83hY3pjd7wp1Dl7wPunwgGlk
         +YfJa8RJyUOhJEx/Sc/WLaN0XuFUmqoE2HoOxeSym8JIUUd+XPiz6p4wsski+NX02cAN
         k1dhuiCyzNjd0Uzxadgl3cCRyV5cN7sIT3c7yCfr9PDrlN1pFH6Ai4yio3egZJiv638r
         F2A/yDiFFCFF/ASxPh2iAFfsywa+ooob4PqqtpdUeTabdxgRYh7M4ft48o5S7DKISggW
         EsZBp97XqqGaFCaO2+ZPOGxpr+/sYyX/aaErEHgNiiP+UhWN8TNiodvMZjkLMzjKwTWw
         Re8g==
X-Gm-Message-State: ANoB5pkOj7wjYA9wXuQaQxkwxtDLjhOiFBULO0mgMjeoWi5mMf5RgflM
	MBcOQwTb0BVSeOC9uU83aw==
X-Google-Smtp-Source: AA0mqf7NpqAOHvnw7gsjMPErdhx488BE0DOOs4rFZ+Q1ilWNL8hQUZr7D7iE4DKBVfw712+L/ukaiw==
X-Received: by 2002:aca:3dc5:0:b0:359:a845:76bf with SMTP id k188-20020aca3dc5000000b00359a84576bfmr20031267oia.22.1669764618136;
        Tue, 29 Nov 2022 15:30:18 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m22-20020a056870059600b0013c8ae74a14sm25463oap.42.2022.11.29.15.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 15:30:17 -0800 (PST)
Received: (nullmailer pid 494706 invoked by uid 1000);
	Tue, 29 Nov 2022 23:30:16 -0000
Date: Tue, 29 Nov 2022 17:30:16 -0600
From: Rob Herring <robh@kernel.org>
To: Hector Martin <marcan@marcan.st>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, Mark Kettenis <mark.kettenis@xs4all.nl>, linux-pm@vger.kernel.org, asahi@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Sven Peter <sven@svenpeter.dev>, "Rafael J. Wysocki" <rafael@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v5 2/4] dt-bindings: cpufreq: apple,soc-cpufreq: Add
 binding for Apple SoC cpufreq
Message-ID: <166976452497.492619.4657547716318967067.robh@kernel.org>
References: <20221128142912.16022-1-marcan@marcan.st>
 <20221128142912.16022-3-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221128142912.16022-3-marcan@marcan.st>


On Mon, 28 Nov 2022 23:29:10 +0900, Hector Martin wrote:
> This binding represents the cpufreq/DVFS hardware present in Apple SoCs.
> The hardware has an independent controller per CPU cluster, and we
> represent them as unique nodes in order to accurately describe the
> hardware. The driver is responsible for binding them as a single cpufreq
> device (in the Linux cpufreq model).
> 
> Acked-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  .../cpufreq/apple,cluster-cpufreq.yaml        | 117 ++++++++++++++++++
>  1 file changed, 117 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml

In case there's any doubt:

Reviewed-by: Rob Herring <robh@kernel.org>

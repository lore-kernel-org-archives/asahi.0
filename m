Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08480D53E
	for <asahi@lists.linux.dev>; Wed, 16 Nov 2022 20:22:46 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-13ae8117023so21455454fac.9
        for <asahi@lists.linux.dev>; Wed, 16 Nov 2022 12:22:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgK1rUnmFyPXMa4kFguFgRQCBODLxAzA5c3KNx4CYyA=;
        b=BxmtvmaWp0Jktv1RKkwovU5jXOjJ/F0aCEG3bt1/uc4aiZ7URsDgK8CAKfPo2PCKV7
         db6+/vImQmnkcANnznXz8gyOzDTHwYm8zGRXjz46rLMGz2t50xQaDMpyzYFTPbC+MVcL
         3/XlmiLlYpi5ET6YVaIb+y4MMnvEEcuF88gd9PD+QAEU3xTA4jUt+yhQVJGhwDmxEs2j
         FrDX7ugaq3TAxXmDbCY1cBL5BFrLMN/CnSuQPlQzjG8KB66kNKh+g8hJrvrl5DTFtUUE
         J4HoqsBcUytBTlBJJqb+9wOeD4Cu4MXAfppyPfwN0Toc2yi+3oTDbQHTWyKvFGCNJLcU
         5B5Q==
X-Gm-Message-State: ANoB5pm52ERUJD3Zr7ixLuKocqc/NRvQNWzyAvIdN5pVVk6mtjlLnbP8
	bjrcV1FgnIzzQW4gGy1YTQ==
X-Google-Smtp-Source: AA0mqf6Zz+aI/iuvrsoTgE0DD8XHfnfXOCIxD7/a202TUht3yY/MjAgq/K+lsqKSP6eH9QbNcQQfOQ==
X-Received: by 2002:a05:6870:6a98:b0:136:66d0:b853 with SMTP id mv24-20020a0568706a9800b0013666d0b853mr2596240oab.161.1668630165974;
        Wed, 16 Nov 2022 12:22:45 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e11-20020a056870238b00b00136f3e4bc29sm5007128oap.9.2022.11.16.12.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 12:22:45 -0800 (PST)
Received: (nullmailer pid 826080 invoked by uid 1000);
	Wed, 16 Nov 2022 20:22:47 -0000
Date: Wed, 16 Nov 2022 14:22:47 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, Amit Kucheria <amitk@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Zhang Rui <rui.zhang@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Thara Gopinath <thara.gopinath@linaro.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, linux-arm-kernel@lists.infradead.org, Sven Peter <sven@svenpeter.dev>, Magnus Damm <magnus.damm@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, asahi@lists.linux.dev, devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>, Hector Martin <marcan@marcan.st>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop type from 'cpus' property
Message-ID: <166863016450.825960.2284429197449442060.robh@kernel.org>
References: <20221111212857.4104308-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111212857.4104308-1-robh@kernel.org>


On Fri, 11 Nov 2022 15:28:56 -0600, Rob Herring wrote:
> 'cpus' is a common property, and it is now defined in dtschema schemas,
> so drop the type references in the tree.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/interrupt-controller/apple,aic.yaml | 1 -
>  Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml     | 3 ---
>  Documentation/devicetree/bindings/power/renesas,apmu.yaml   | 6 ++----
>  Documentation/devicetree/bindings/thermal/qcom-lmh.yaml     | 2 +-
>  4 files changed, 3 insertions(+), 9 deletions(-)
> 

Applied, thanks!

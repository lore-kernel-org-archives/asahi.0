Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E1A6105
	for <asahi@lists.linux.dev>; Wed, 15 Feb 2023 20:46:15 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-16e2c22c3baso206161fac.8
        for <asahi@lists.linux.dev>; Wed, 15 Feb 2023 12:46:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRSeJHy2SyPDaHEW/c54mDyRYYoKFp26R/Pea6LkzEc=;
        b=g0e2F3Es8q8ZpELeX7xEwnrc7xQBxGQ2OEFxz9Fodhd2auccmtsU/9R6YWYn7qmWvR
         XYaJEgdcyaQWnC55PS9uQZ2qa4XBfUuvh8X1u3XIAuuP3dcJdy1ORqhcyhaSyIyyMgpB
         OF35SYxyQNSOhAioopHIlV0sxdYjIlX+LyAHQ2NCMavifTaJX/VX/oCKETIafjmPWLbU
         FnFllovWrh9crTGtFSUxvrwgrtyaJzw5Sth3IRbnNC3WBM8zaYO3u5WgHtTVHd7cmtIk
         GxgJwZGpvrAjBCFyfJC8LzVuyo9Dw3XIjPnsFwO2A5P/3uhVW12+08o0Qf0uF20JY4yd
         cqmw==
X-Gm-Message-State: AO0yUKVesPj+rvPm6FOUdY9qmxmf/XS82fWdbfHRF7ZK2nZ3dph2gWEY
	o9DS8RECsuQXrlXizq92IQ==
X-Google-Smtp-Source: AK7set9Qx/gWbtf7g0aqU3LEWnLSu3VeF6+00UZ95YNE+jQ7rAp4apcpfYgMAuHmUQO0WUzv4gkNMA==
X-Received: by 2002:a05:6870:7392:b0:16d:db03:9efa with SMTP id z18-20020a056870739200b0016ddb039efamr1820371oam.28.1676493974619;
        Wed, 15 Feb 2023 12:46:14 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id e3-20020a056870c34300b0016dc6d38b16sm5623730oak.23.2023.02.15.12.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 12:46:14 -0800 (PST)
Received: (nullmailer pid 525019 invoked by uid 1000);
	Wed, 15 Feb 2023 20:46:13 -0000
Date: Wed, 15 Feb 2023 14:46:13 -0600
From: Rob Herring <robh@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev, Will Deacon <will@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: arm-pmu: Add PMU compatible strings for
 Apple M2 cores
Message-ID: <167649397316.524961.8297827132612365519.robh@kernel.org>
References: <20230214-apple_m2_pmu-v1-0-9c9213ab9b63@jannau.net>
 <20230214-apple_m2_pmu-v1-1-9c9213ab9b63@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230214-apple_m2_pmu-v1-1-9c9213ab9b63@jannau.net>


On Tue, 14 Feb 2023 11:38:01 +0100, Janne Grunau wrote:
> The PMUs on the Apple M2 cores avalanche and blizzard CPU are compatible
> with M1 ones. As on M1 we don't know exactly what the counters count so
> use a distinct compatible for each micro-architecture.
> Apple's PMU counter description omits a counter for M2 so there
> is some variation on the interpretation of the counters.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  Documentation/devicetree/bindings/arm/pmu.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9322A7B
	for <asahi@lists.linux.dev>; Tue, 25 Oct 2022 23:12:37 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso8844765otb.6
        for <asahi@lists.linux.dev>; Tue, 25 Oct 2022 16:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRrEEf9YiRUt4v0hkZPiB4Bxt9hmfog8mLXW/+6+K/E=;
        b=NLQnuvrLHc2yaZ7iOaoqNxR1p8rh8LWa7FFMq+bTcW8sF3W6+pDE495nHpDrufCeKz
         HK97wLzxUS2CIM/9XWqq7Hj+wUKXQqwUjdhjen9FkKluWpHf8nLsWV8czpvjhTTwP/Gb
         HzSyomVJDgpddz7KLoTiN9pYyi4cd5lQfiasIuaUWBwwUrko7D4+m1FBsdYemiJzu5Rq
         nPv9s1V+u5NHKcbWZEJuEcJ7HFiN4sCf+W1LnoFWN+PT8NphZFXulAKhgz/x7rMjuQfa
         To9Cp808BcCSTCPemC1jjbQKlV9bqbL98Q1KOlwg925n6YMK/jw7q1ZA5ZyKMLQZ0m8z
         xKoQ==
X-Gm-Message-State: ACrzQf2vkqjKFvZZdvJU1Nn272MuU+qLq8z8RorM8Zeh+OT6dGFNRYTZ
	frksY0P1ZU8GKq5eV3SU+g==
X-Google-Smtp-Source: AMsMyM5n2yXaqLQhmHmFtxDIVMg/fe7mrUK1FKIQs9kPsJaabo0UCR9ubpWxzWKxK/TfoFcL1ifXvg==
X-Received: by 2002:a05:6830:4487:b0:661:dba8:cc61 with SMTP id r7-20020a056830448700b00661dba8cc61mr20275561otv.256.1666739556607;
        Tue, 25 Oct 2022 16:12:36 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 187-20020a4a06c4000000b00480e77f90f9sm1613263ooj.41.2022.10.25.16.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 16:12:35 -0700 (PDT)
Received: (nullmailer pid 3429121 invoked by uid 1000);
	Tue, 25 Oct 2022 23:12:36 -0000
Date: Tue, 25 Oct 2022 18:12:36 -0500
From: Rob Herring <robh@kernel.org>
To: Hector Martin <marcan@marcan.st>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Marc Zyngier <maz@kernel.org>, Mark Kettenis <mark.kettenis@xs4all.nl>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: cpufreq: apple,soc-cpufreq: Add
 binding for Apple SoC cpufreq
Message-ID: <20221025231236.GA3416036-robh@kernel.org>
References: <20221024043925.25379-1-marcan@marcan.st>
 <20221024043925.25379-3-marcan@marcan.st>
 <5c3126fb-8fdb-5163-95a8-136a4a7ee2ce@linaro.org>
 <97d3d6d4-b19c-a194-de41-f17e65bf3eb6@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97d3d6d4-b19c-a194-de41-f17e65bf3eb6@marcan.st>

On Wed, Oct 26, 2022 at 02:22:40AM +0900, Hector Martin wrote:
> On 26/10/2022 01.01, Krzysztof Kozlowski wrote:
> > On 24/10/2022 00:39, Hector Martin wrote:
> >> This binding represents the cpufreq/DVFS hardware present in Apple SoCs.
> >> The hardware has an independent controller per CPU cluster, and we
> >> represent them as unique nodes in order to accurately describe the
> >> hardware. The driver is responsible for binding them as a single cpufreq
> >> device (in the Linux cpufreq model).
> >>
> >> Signed-off-by: Hector Martin <marcan@marcan.st>
> >> ---
> >>  .../cpufreq/apple,cluster-cpufreq.yaml        | 119 ++++++++++++++++++
> >>  1 file changed, 119 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> >> new file mode 100644
> >> index 000000000000..b11452f91468
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> >> @@ -0,0 +1,119 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Apple SoC cluster cpufreq device
> > 
> > Few nits, in general looks fine to me.
> > 
> >> +
> >> +maintainers:
> >> +  - Hector Martin <marcan@marcan.st>
> >> +
> >> +description: |
> >> +  Apple SoCs (e.g. M1) have a per-cpu-cluster DVFS controller that is part of
> >> +  the cluster management register block. This binding uses the standard
> >> +  operating-points-v2 table to define the CPU performance states, with the
> >> +  opp-level property specifying the hardware p-state index for that level.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    oneOf:
> >> +      - items:
> >> +          - const: apple,t8103-cluster-cpufreq
> >> +          - const: apple,cluster-cpufreq
> >> +      - items:
> >> +          - const: apple,t6000-cluster-cpufreq
> >> +          - const: apple,t8103-cluster-cpufreq
> >> +          - const: apple,cluster-cpufreq
> >> +      - items:
> >> +          - const: apple,t8112-cluster-cpufreq
> > 
> > With the first one (t8103) - it's an enum.
> 
> This is deliberate. t6000 is compatible with t8103, but t8112 is not
> (though all are compatible with what the generic apple,cluster-cpufreq
> compatible implies).

What does compatible mean here? IOW, what can a client do with 
'apple,cluster-cpufreq' alone? It's one thing for self-contained blocks 
to remain unchanged from chip to chip, but things like this tend to 
change frequently. It looks like for 4 chips we have 3 different 
versions.

Rob

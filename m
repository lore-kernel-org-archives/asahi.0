Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6CA811
	for <asahi@lists.linux.dev>; Tue, 29 Nov 2022 11:37:30 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id b11so12400143pjp.2
        for <asahi@lists.linux.dev>; Tue, 29 Nov 2022 03:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jxt7XJEYGG/DEIW5w0DACPgROVLQHrBVTMD19NFNGTc=;
        b=g6xuAB7M1cwuReyoLI1Pz9XWawK/Zcxp6jAQagnKiAYgrPJw2PTWF/qIR5RdrQyTGd
         bldSnpkydHwp+/FKZdouI3BJpDHolO0ZJaGN/1Ec+Bw2WwKVeoM/5yRZRgjZiqekNrwU
         rrq06E/HLYzhu36U0VJM7R0VTIC/uXuoGLI1sqDqA/OEnCpgcVZHnQoFRYJMAh6otBLO
         G04xxQ9fqfjMvaYWJIwpo91wqar/qgGQ3K0NcZWczLFfmW3vbKsT2oXmxO2ar15J4kyL
         cVKhr4mNmD5gK57PgeXY8H0gJSLAEh/hUIpHl6a1g6skJhey2ojmFmbgGC7+LdIh7tMn
         QFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxt7XJEYGG/DEIW5w0DACPgROVLQHrBVTMD19NFNGTc=;
        b=gfz4hOUbF3lETaYwH5lw595oHWykmpR+T+4cSibECMNQUuwnkjthDbz9rQkq2LFb+J
         AVtNTQxEiFHKRF6XauzntJSRxCGBCI3UNNFP32PpqP71YHhQQ15i9obCT2ZlcPySTho4
         Uh07eplrLm2W/7JZA4Ipp65MlCqXnIWSYrtsXqX4h8f+wM5ktkB38yN5oduQTe5J6TqZ
         1PutEi28E4cnmKLGJ30gOAbLdMo7hItpWwbd6Q08/Jj093QuwaFuGHIABajEcYQ632VH
         az/LH1haVKTDJCYCD2dJnsO2gMb7cHwNRnn7D2I//WjFkh7OPH5dEj4Yw6B++iX30fmk
         qOgQ==
X-Gm-Message-State: ANoB5pkyY7Sj7fOptXuRflSRPRcKPSxsRwOMe8A3ghvu5v53KL+5VQfE
	+ylZkFHNuxc8cMjbh2Bn5pyvqe25tGrXwQnpztlhlA==
X-Google-Smtp-Source: AA0mqf49JkGCFX8uW+xdTRt6k8iounPurzJuv8HbDZZ8T0XZrXWRbIj9Uqnho0Ewn/u7YwNkOC3dNefGn8Nzl/EqDeY=
X-Received: by 2002:a17:90b:1d45:b0:218:6db5:fd98 with SMTP id
 ok5-20020a17090b1d4500b002186db5fd98mr60801030pjb.164.1669721850067; Tue, 29
 Nov 2022 03:37:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221128142912.16022-1-marcan@marcan.st> <20221128142912.16022-3-marcan@marcan.st>
In-Reply-To: <20221128142912.16022-3-marcan@marcan.st>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 29 Nov 2022 12:36:53 +0100
Message-ID: <CAPDyKFobMvef_BWGMR=7avODh2r5XNMGpwO3xYgrN-u=DqRwbg@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: cpufreq: apple,soc-cpufreq: Add
 binding for Apple SoC cpufreq
To: Hector Martin <marcan@marcan.st>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Mark Kettenis <mark.kettenis@xs4all.nl>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Nov 2022 at 15:29, Hector Martin <marcan@marcan.st> wrote:
>
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
>
> diff --git a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> new file mode 100644
> index 000000000000..76cb9726660e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple SoC cluster cpufreq device
> +
> +maintainers:
> +  - Hector Martin <marcan@marcan.st>
> +
> +description: |
> +  Apple SoCs (e.g. M1) have a per-cpu-cluster DVFS controller that is part of
> +  the cluster management register block. This binding uses the standard
> +  operating-points-v2 table to define the CPU performance states, with the
> +  opp-level property specifying the hardware p-state index for that level.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - apple,t8103-cluster-cpufreq
> +              - apple,t8112-cluster-cpufreq
> +          - const: apple,cluster-cpufreq
> +      - items:
> +          - const: apple,t6000-cluster-cpufreq
> +          - const: apple,t8103-cluster-cpufreq
> +          - const: apple,cluster-cpufreq
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#performance-domain-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#performance-domain-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    // This example shows a single CPU per domain and 2 domains,
> +    // with two p-states per domain.
> +    // Shipping hardware has 2-4 CPUs per domain and 2-6 domains.
> +    cpus {
> +      #address-cells = <2>;
> +      #size-cells = <0>;
> +
> +      cpu@0 {
> +        compatible = "apple,icestorm";
> +        device_type = "cpu";
> +        reg = <0x0 0x0>;
> +        operating-points-v2 = <&ecluster_opp>;

To me, it looks like the operating-points-v2 phandle better belongs in
the performance-domains provider node. I mean, isn't the OPPs really a
description of the performance-domain provider?

That said, I suggest we try to extend the generic performance-domain
binding [1] with an "operating-points-v2". In that way, we should
instead be able to reference it from this binding.

In fact, that would be very similar to what already exists for the
generic power-domain binding [2]. I think it would be rather nice to
follow a similar pattern for the performance-domain binding.

> +        performance-domains = <&cpufreq_e>;
> +      };
> +
> +      cpu@10100 {
> +        compatible = "apple,firestorm";
> +        device_type = "cpu";
> +        reg = <0x0 0x10100>;
> +        operating-points-v2 = <&pcluster_opp>;
> +        performance-domains = <&cpufreq_p>;
> +      };
> +    };
> +
> +    ecluster_opp: opp-table-0 {
> +      compatible = "operating-points-v2";
> +      opp-shared;
> +
> +      opp01 {
> +        opp-hz = /bits/ 64 <600000000>;
> +        opp-level = <1>;
> +        clock-latency-ns = <7500>;
> +      };
> +      opp02 {
> +        opp-hz = /bits/ 64 <972000000>;
> +        opp-level = <2>;
> +        clock-latency-ns = <22000>;
> +      };
> +    };
> +
> +    pcluster_opp: opp-table-1 {
> +      compatible = "operating-points-v2";
> +      opp-shared;
> +
> +      opp01 {
> +        opp-hz = /bits/ 64 <600000000>;
> +        opp-level = <1>;
> +        clock-latency-ns = <8000>;
> +      };
> +      opp02 {
> +        opp-hz = /bits/ 64 <828000000>;
> +        opp-level = <2>;
> +        clock-latency-ns = <19000>;
> +      };
> +    };
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      cpufreq_e: performance-controller@210e20000 {
> +        compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
> +        reg = <0x2 0x10e20000 0 0x1000>;
> +        #performance-domain-cells = <0>;
> +      };
> +
> +      cpufreq_p: performance-controller@211e20000 {
> +        compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
> +        reg = <0x2 0x11e20000 0 0x1000>;
> +        #performance-domain-cells = <0>;
> +      };
> +    };

Kind regards
Uffe

[1]
Documentation/devicetree/bindings/dvfs/performance-domain.yaml
[2]
Documentation/devicetree/bindings/power/power-domain.yaml

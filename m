Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AB48BF0
	for <asahi@lists.linux.dev>; Mon, 28 Nov 2022 14:15:03 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id t62so11634518oib.12
        for <asahi@lists.linux.dev>; Mon, 28 Nov 2022 06:15:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rMDrKJM1JYq9frHiDAV6QjHrjgaT+Wd+P/w7Ou0pGrc=;
        b=qwXU+lwqLh52E04NDQcqMT2mUD4XrY0PSyGjHtGl47EHxkeyiXmDjU8gWXg3QH2QGy
         ZwMWtbFAfLnuyAGTTYXacGOMmeZJ7s7BiXZtjCpGNlYsSRoaWui5sBfp3vO67uKLx/oO
         pZWBsrJuoBDxI/iniy+id3lNbft1QsepHW7mb7yRlYScS0UkjRy6mKeuHHKwzUAOtqBY
         aQwD3VRRjpjK8rmHAUBqCc8JymlEujxxSEKy234WIVcNdKaDrFVYxD5AdGbicBbpk+7E
         QKc5nUQdM6Bk2N9CD5Px0Ofmx40i3mr/nv0YdFtP200LrVM5F55Ou2snAKKCWLNhnATq
         p6dw==
X-Gm-Message-State: ANoB5pncG2A103/KxsxC23bIAaZpOz/2Gl7J7oY+aSqDIED4W8foKqQL
	+onPVbcVVjW+P0lsldqoQA==
X-Google-Smtp-Source: AA0mqf7GaLmT+j6KXYSEaDabzZGvwPVlEA86w3Pu8lzi8pqWtO//a4CTd3PVxjYaNKvONEotUcwvLA==
X-Received: by 2002:a05:6808:22a1:b0:35b:8a39:ab76 with SMTP id bo33-20020a05680822a100b0035b8a39ab76mr8955735oib.196.1669644902054;
        Mon, 28 Nov 2022 06:15:02 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t12-20020a056870e74c00b001375188dae9sm5946085oak.16.2022.11.28.06.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 06:15:01 -0800 (PST)
Received: (nullmailer pid 722965 invoked by uid 1000);
	Mon, 28 Nov 2022 14:15:00 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Hector Martin <marcan@marcan.st>
Cc: linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>, Marc Zyngier <maz@kernel.org>, Sven Peter <sven@svenpeter.dev>, Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Kettenis <mark.kettenis@xs4all.nl>, Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, asahi@lists.linux.dev
In-Reply-To: <20221128124216.13477-3-marcan@marcan.st>
References: <20221128124216.13477-1-marcan@marcan.st>
 <20221128124216.13477-3-marcan@marcan.st>
Message-Id: <166964486801.717655.2608444925832576232.robh@kernel.org>
Subject: Re: [PATCH v4 2/4] dt-bindings: cpufreq: apple,soc-cpufreq: Add
 binding for Apple SoC cpufreq
Date: Mon, 28 Nov 2022 08:15:00 -0600


On Mon, 28 Nov 2022 21:42:14 +0900, Hector Martin wrote:
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

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml: properties:compatible:oneOf:0:items: 'anyOf' conditional failed, one must be fixed:
	[{'oneOf': ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']}, {'const': 'apple,cluster-cpufreq'}] is not of type 'object', 'boolean'
	'apple,t8103-cluster-cpufreq' is not of type 'object', 'boolean'
	'apple,t8112-cluster-cpufreq' is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml: properties:compatible:oneOf:0:items: 'oneOf' conditional failed, one must be fixed:
	[{'oneOf': ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']}, {'const': 'apple,cluster-cpufreq'}] is not of type 'object'
	['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq'] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
		hint: Use 'enum' rather than 'oneOf' + 'const' entries
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml: properties:compatible:oneOf:0:items: 'oneOf' conditional failed, one must be fixed:
	[{'oneOf': ['apple,t8103-cluster-cpufreq', 'apple,t8112-cluster-cpufreq']}, {'const': 'apple,cluster-cpufreq'}] is not of type 'object'
	Additional properties are not allowed ('oneOf' was unexpected)
	from schema $id: http://devicetree.org/meta-schemas/string-array.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml: ignoring, error in schema: properties: compatible: oneOf: 0: items
Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.example.dtb:0:0: /example-0/soc/performance-controller@210e20000: failed to match any schema with compatible: ['apple,t8103-cluster-cpufreq', 'apple,cluster-cpufreq']
Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.example.dtb:0:0: /example-0/soc/performance-controller@210e20000: failed to match any schema with compatible: ['apple,t8103-cluster-cpufreq', 'apple,cluster-cpufreq']
Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.example.dtb:0:0: /example-0/soc/performance-controller@211e20000: failed to match any schema with compatible: ['apple,t8103-cluster-cpufreq', 'apple,cluster-cpufreq']
Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.example.dtb:0:0: /example-0/soc/performance-controller@211e20000: failed to match any schema with compatible: ['apple,t8103-cluster-cpufreq', 'apple,cluster-cpufreq']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221128124216.13477-3-marcan@marcan.st

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command.


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FA87F5
	for <asahi@lists.linux.dev>; Sat, 12 Nov 2022 03:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B6EC433C1;
	Sat, 12 Nov 2022 03:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668222723;
	bh=MxwW5U7TdQxJ1Sydv6lxRBV2aA6sfnJ2ctEXlcKGnc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i9HtqE1xepwA4LnmB3EVAibEyFJL75n2Id6SUoDVRP8+pzWZiQUestCBjsi6iT01l
	 +UDwk+M4/yDJhGLLCS+XPHhwwMX25lx6Ng4EWtW9WR2CLxVf0ooJrjxPM0D7EyyP9b
	 6r9gDVM6i99PzW9jopj9Mgvg7mKNdrxrl6wo6mhDCZZehbSl+dcZlGEUTOHe3+AnJ8
	 ctRWtDpnSO8e8QFw0CSoUvmQbbSWVNDpkVY5GFk4Vzyy/IVXL0EBLX4r1ZnwVFlY17
	 HcNU8lKRdSoMHRVasSamnakdQrbIIXV3HzpASUQd/jl7bp21AhpsgxdR5NrFEu6tTu
	 ihDSNoPSGKgCQ==
Date: Fri, 11 Nov 2022 21:11:59 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Thara Gopinath <thara.gopinath@linaro.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Drop type from 'cpus' property
Message-ID: <20221112031159.cptoshbcfjdk7rs5@builder.lan>
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

On Fri, Nov 11, 2022 at 03:28:56PM -0600, Rob Herring wrote:
> 'cpus' is a common property, and it is now defined in dtschema schemas,
> so drop the type references in the tree.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Bjorn Andersson <andersson@kernel.org>

> ---
>  .../devicetree/bindings/interrupt-controller/apple,aic.yaml | 1 -
>  Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml     | 3 ---
>  Documentation/devicetree/bindings/power/renesas,apmu.yaml   | 6 ++----
>  Documentation/devicetree/bindings/thermal/qcom-lmh.yaml     | 2 +-
>  4 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
> index e18107eafe7c..698588e9aa86 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
> @@ -90,7 +90,6 @@ properties:
>              maximum: 5
>  
>            cpus:
> -            $ref: /schemas/types.yaml#/definitions/phandle-array
>              description:
>                Should be a list of phandles to CPU nodes (as described in
>                Documentation/devicetree/bindings/arm/cpus.yaml).
> diff --git a/Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml b/Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml
> index c87821be158b..a740378ed592 100644
> --- a/Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml
> +++ b/Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml
> @@ -32,11 +32,8 @@ properties:
>        - description: nCLUSTERPMUIRQ interrupt
>  
>    cpus:
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
>      minItems: 1
>      maxItems: 12
> -    items:
> -      maxItems: 1
>      description: List of phandles for the CPUs connected to this DSU instance.
>  
>  required:
> diff --git a/Documentation/devicetree/bindings/power/renesas,apmu.yaml b/Documentation/devicetree/bindings/power/renesas,apmu.yaml
> index f2cc89e7f4e4..2b4d802ef4b2 100644
> --- a/Documentation/devicetree/bindings/power/renesas,apmu.yaml
> +++ b/Documentation/devicetree/bindings/power/renesas,apmu.yaml
> @@ -34,10 +34,8 @@ properties:
>      maxItems: 1
>  
>    cpus:
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
> -    items:
> -      minItems: 1
> -      maxItems: 4
> +    minItems: 1
> +    maxItems: 4
>      description: |
>        Array of phandles pointing to CPU cores, which should match the order of
>        CPU cores used by the WUPCR and PSTR registers in the Advanced Power
> diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
> index e1587ddf7de3..92762efc2120 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
> @@ -37,7 +37,7 @@ properties:
>    cpus:
>      description:
>        phandle of the first cpu in the LMh cluster
> -    $ref: /schemas/types.yaml#/definitions/phandle
> +    maxItems: 1
>  
>    qcom,lmh-temp-arm-millicelsius:
>      description:
> -- 
> 2.35.1
> 

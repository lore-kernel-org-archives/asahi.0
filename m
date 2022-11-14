Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA0F10E6
	for <asahi@lists.linux.dev>; Mon, 14 Nov 2022 10:30:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B31A23A;
	Mon, 14 Nov 2022 02:30:11 -0800 (PST)
Received: from [10.57.39.18] (unknown [10.57.39.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 328A73F534;
	Mon, 14 Nov 2022 02:30:01 -0800 (PST)
Message-ID: <f9e3cd4e-e31a-8395-2f25-f69fb4a82370@arm.com>
Date: Mon, 14 Nov 2022 10:29:55 +0000
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: Drop type from 'cpus' property
To: Rob Herring <robh@kernel.org>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria
 <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Thara Gopinath <thara.gopinath@linaro.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
References: <20221111212857.4104308-1-robh@kernel.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20221111212857.4104308-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2022 21:28, Rob Herring wrote:
> 'cpus' is a common property, and it is now defined in dtschema schemas,
> so drop the type references in the tree.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../devicetree/bindings/interrupt-controller/apple,aic.yaml | 1 -
>   Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml     | 3 ---
>   Documentation/devicetree/bindings/power/renesas,apmu.yaml   | 6 ++----
>   Documentation/devicetree/bindings/thermal/qcom-lmh.yaml     | 2 +-
>   4 files changed, 3 insertions(+), 9 deletions(-)
> 

...

> diff --git a/Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml b/Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml
> index c87821be158b..a740378ed592 100644
> --- a/Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml
> +++ b/Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml
> @@ -32,11 +32,8 @@ properties:
>         - description: nCLUSTERPMUIRQ interrupt
>   
>     cpus:
> -    $ref: /schemas/types.yaml#/definitions/phandle-array
>       minItems: 1
>       maxItems: 12
> -    items:
> -      maxItems: 1
>       description: List of phandles for the CPUs connected to this DSU instance.
>   
>   required:

Acked-by: Suzuki K Poulose <suzuki.poulse@arm.com>

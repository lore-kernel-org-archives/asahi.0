Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71D37479
	for <asahi@lists.linux.dev>; Tue, 25 Oct 2022 17:22:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id BE83641F98;
	Tue, 25 Oct 2022 17:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1666718567; bh=/O2uQ199NxA7fBnRspJIbWTHryuWIxiaxP/IP6rbDdc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=slvlI7zPUW0l+pljaARNcDBO8cZf3IEt/MLEKTPSKDcjKLcEzBqOsQf3cub4fuydD
	 EVoLVRK3vt8Jj+xRFfbX0Sa6OJDE9q3VkfkzwTlZrooiol1EALRHnx6NazYOMuLbpG
	 XAwwxJaRcUTP1MUkfWqHrZHGQ9IiwWMPRfK3+EjPLUb0DcDpeMKcV/0PoipYLwNTdP
	 7ZwNeZQvBenrzIXO9rOMwM7mgoMba1xQOCks4OQ9Th11Vbu+Whm1fV6842dGPvOqjk
	 Nj9csE4q3O2LMzq24gu/vKyYkcjNmQDSLEr7knqamaJfGoFHv5rYIWj+krPDvq5aYi
	 oNbDi5x4k8dEQ==
Message-ID: <97d3d6d4-b19c-a194-de41-f17e65bf3eb6@marcan.st>
Date: Wed, 26 Oct 2022 02:22:40 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 2/5] dt-bindings: cpufreq: apple,soc-cpufreq: Add
 binding for Apple SoC cpufreq
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Marc Zyngier <maz@kernel.org>, Mark Kettenis <mark.kettenis@xs4all.nl>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221024043925.25379-1-marcan@marcan.st>
 <20221024043925.25379-3-marcan@marcan.st>
 <5c3126fb-8fdb-5163-95a8-136a4a7ee2ce@linaro.org>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <5c3126fb-8fdb-5163-95a8-136a4a7ee2ce@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/10/2022 01.01, Krzysztof Kozlowski wrote:
> On 24/10/2022 00:39, Hector Martin wrote:
>> This binding represents the cpufreq/DVFS hardware present in Apple SoCs.
>> The hardware has an independent controller per CPU cluster, and we
>> represent them as unique nodes in order to accurately describe the
>> hardware. The driver is responsible for binding them as a single cpufreq
>> device (in the Linux cpufreq model).
>>
>> Signed-off-by: Hector Martin <marcan@marcan.st>
>> ---
>>  .../cpufreq/apple,cluster-cpufreq.yaml        | 119 ++++++++++++++++++
>>  1 file changed, 119 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
>> new file mode 100644
>> index 000000000000..b11452f91468
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
>> @@ -0,0 +1,119 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/cpufreq/apple,cluster-cpufreq.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Apple SoC cluster cpufreq device
> 
> Few nits, in general looks fine to me.
> 
>> +
>> +maintainers:
>> +  - Hector Martin <marcan@marcan.st>
>> +
>> +description: |
>> +  Apple SoCs (e.g. M1) have a per-cpu-cluster DVFS controller that is part of
>> +  the cluster management register block. This binding uses the standard
>> +  operating-points-v2 table to define the CPU performance states, with the
>> +  opp-level property specifying the hardware p-state index for that level.
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - items:
>> +          - const: apple,t8103-cluster-cpufreq
>> +          - const: apple,cluster-cpufreq
>> +      - items:
>> +          - const: apple,t6000-cluster-cpufreq
>> +          - const: apple,t8103-cluster-cpufreq
>> +          - const: apple,cluster-cpufreq
>> +      - items:
>> +          - const: apple,t8112-cluster-cpufreq
> 
> With the first one (t8103) - it's an enum.

This is deliberate. t6000 is compatible with t8103, but t8112 is not
(though all are compatible with what the generic apple,cluster-cpufreq
compatible implies).

Ack on the rest, I'll spin a v4 in a few days if there are no other
comments. Thanks!

- Hector

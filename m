Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE9F7B
	for <asahi@lists.linux.dev>; Tue, 25 Oct 2022 16:02:37 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id l9so5829525qkk.11
        for <asahi@lists.linux.dev>; Tue, 25 Oct 2022 09:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7pGkJc93t4XHow6PfRqMAHBDJ4RPCkSR1Pf3xadIrCU=;
        b=SIe8n72+y1kEIAoch9h1uTh83dmjyrtwUDXwR49pPtgKaa8fiocc+xDxIeuNNF1xGy
         J4cAQ/I4jr8DUXLZyJ92bDYWfayqzdRNuJrZK6lJSpxDKrFfbXdz4FjPuW1RG9smqVG4
         9q218uQkBOAvI/wYNnJcmTRdlTO0dLDTevZSACp7aznSNuiZRKIvveeYCIfzIQ7SZmXV
         PwpOVXPzSnI7GCjVcg/IJ83YD/K7rrwvfPmqRK/qXDdE5/kpnTNbdzJTT5TcmqUckKam
         BdEMfSsDFNH9Xhmyv6s5OCiaUoFDYSmBXF28UU5UMLadV5osVNB4nB/JsubNeBLbXSPh
         L2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7pGkJc93t4XHow6PfRqMAHBDJ4RPCkSR1Pf3xadIrCU=;
        b=vjyQHUt1dBg3uLPSkkh6ugZPcLe5fZrxD7VUDKaK0k6KqcVTT4IkCfxdTO72m8annk
         ldwAnriT/qTbSGMOO5Gt7ETkEu4ZkrCGt7LyZNmJC37GK6C8/i0slxve8SqT34caBKq9
         CxzxPVxAldlWqkcFs5webOnOzMHTLYZE3SryL5Ao9hb6abMzBmPtU/0KSBJZwuDzNZcf
         WyOn7Apa4uZSDn+lopFc/6kHnFa8BsUL10sv0C9Bk3G5oVY02jikx1xJAQQ98LmJvdpT
         W8kk5OuMN1Ij82iY2qikuc+tpW74O9mINWxRBESwKSxeABj7SaRUghB3enTWuaWRC0Iu
         uizA==
X-Gm-Message-State: ACrzQf35TVU8MZ7Hhf7wB+vlZIcOkO9IVT3ZzcwoSRmChXGWm/2rF6Hz
	Nzgu70/g2rAKUlQZb6IWAfXMdg==
X-Google-Smtp-Source: AMsMyM6pX7Eil0FyKEI9e8Ft2/z18UKFTF36FYyYjt8eQKd6AWyFYhXNIbzd6/rZfO6ndBKWu9Wzjg==
X-Received: by 2002:a05:620a:1212:b0:6ee:a8ec:c07f with SMTP id u18-20020a05620a121200b006eea8ecc07fmr28121292qkj.334.1666713756708;
        Tue, 25 Oct 2022 09:02:36 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id h2-20020ac81382000000b0038b684a1642sm1809136qtj.32.2022.10.25.09.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 09:02:35 -0700 (PDT)
Message-ID: <9b21fb34-4035-c43e-0e4e-896c2d7ba218@linaro.org>
Date: Tue, 25 Oct 2022 12:02:33 -0400
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v3 5/5] arm64: dts: apple: Add CPU topology & cpufreq
 nodes for t8103
Content-Language: en-US
To: Hector Martin <marcan@marcan.st>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
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
 <20221024043925.25379-6-marcan@marcan.st>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221024043925.25379-6-marcan@marcan.st>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/10/2022 00:39, Hector Martin wrote:
> Add the missing CPU topology/capacity information and the cpufreq nodes,
> so we can have CPU frequency scaling and the scheduler has the
> information it needs to make the correct decisions.
> 

Thank you for your patch. There is something to discuss/improve.

> +
>  	timer {
>  		compatible = "arm,armv8-timer";
>  		interrupt-parent = <&aic>;
> @@ -124,6 +298,18 @@ soc {
>  		ranges;
>  		nonposted-mmio;
>  
> +		cpufreq_e: cpufreq@210e20000 {

Node name: performance-controller

> +			compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
> +			reg = <0x2 0x10e20000 0 0x1000>;
> +			#performance-domain-cells = <0>;
> +		};
> +
> +		cpufreq_p: cpufreq@211e20000 {

Ditto

> +			compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
> +			reg = <0x2 0x11e20000 0 0x1000>;
> +			#performance-domain-cells = <0>;
> +		};
> +
Krzysztof


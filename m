Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF14A18DF93
	for <asahi@lists.linux.dev>; Wed, 16 Apr 2025 00:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744762736; cv=none; b=gs/fPa3bO9iAoG8zcIumDt/nmOXErcBM2BsQgrYLmLlacBKP9O/dqDuUlGE+R7js20/8X56IGvwaPnBOCb3qFoXM8q4481synm4VrbZf+PY4nVyFbHWq/GTHA7PDElp+AkQnX4UE2TEZqqJGeqtQdk0u3wMB9vinOJIv3B4fSQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744762736; c=relaxed/simple;
	bh=5ML4W/RjpK8iw4ZCVAw31Bse8xFTwleELOCMZse8BYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQYvBBcux3GZxlY9IMGVN5BHCw5AMd5zoMa+KZpWPSdo/5loEfY+siG5xnr7wxOwMdb704rhIGe9n7mSvETM+z/2c+NYCX7bIE15CXvbBEfZcfZgdb8Pot2Ut3DMn9fip6qbFZn5rh5Xvo61L6lFrOvnLSlLFhGN38fGYYMxicI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DULA53bc; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DULA53bc"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22c33677183so1556125ad.2
        for <asahi@lists.linux.dev>; Tue, 15 Apr 2025 17:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744762734; x=1745367534; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nfj8ktwxTSwL4bkXkIYJkl6noTbTsbTVvXV1tbIysv0=;
        b=DULA53bcexu2WQW1Uyq+hoTZvGrG0eiJYp/4RTdhe695UvEM0y4IYDgypS4skK/moK
         tKeZT25HMOrLMxt0RFOFO9k7TEGXxP6KLgvc4UMErYVIyQISsJFo8+zLHFJCI3fPtrIL
         MCia/uPakplN2dfaQllmjLOVWKyCKWbdh1Up3iXsKV4+vAwZCoIOH+tvBq4g88iPzZ0z
         Vap7MCCsK6feiMcZLZ2U5EfE+zNs9rXDuilgBn/nEvxJ+xD+OFOWGh272fUFGU6vtVt1
         llT189+x2h2APx8lBqyQzZfb5kv/T/MqtNWabSre8N+lRyxRlz3Bl83cFKsKs153hrLC
         tufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744762734; x=1745367534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nfj8ktwxTSwL4bkXkIYJkl6noTbTsbTVvXV1tbIysv0=;
        b=HvLPNFrnojAJ7iQU93THwP1p8zZp6rzlDgw1nihqvBKA+Nt6ImaZDtJo540UAgGrdG
         H75O3K3Oww7FLoJCkpiPOTIGq1CstD9dhojeBQaSF6avgEN0cJ0XbT2iUJmBh8Y7ixfw
         LRUWPZir4o/27htR4NtU+YBkpVqsRf9gPytw2gociwTQHhex0YXDxu1RJQ/j/F/GMaLO
         6KO+HqfVJQ2QfSbpVmuE4FHpwjotQv3O2euSfA6ueO2Rk4Ua0T/t8Y3a6dqvtc1sjIZQ
         F8F0Os6c6FOvu+mmtpZ0TGUfvoKcSKwcAFljAPfDucycuIvl7YLfx0L/Km3fnwIT4xJo
         H20Q==
X-Gm-Message-State: AOJu0YwzQ09HnQRJi0ic0hpi2GOddEQ4fHW3kodq+VrkWB+cLuGu5MK3
	XfI/joWSkEi/awpz3n1JHCurzZ8Ou35ofs8P1rtYy5ZpODutEESC
X-Gm-Gg: ASbGncufX5nUO7sAnlYvRq3EVVveuKGHoucgT0pNEHwbzaeZn01ObrJ5Irk708ztIRw
	qsDMRgsN/NAoiWeiZUlDZHYM9JXQ+jLYXi46kTcCT46HH105Zl2zbVM8/hYgAV1OZ1eqN43mD1f
	SdapN3jrTr618PV/tzuOLXAVTMobBNWaMn/txdhU+qeC7q+lcPfdKY6Tu2Rs/jSV4MCSatl70o+
	dCcgfcloVJSCB6b0/vjtBdSle6c+P99uzbW59gWhNtJkYh2At8mtqxxrkDuriH/fDel5YGtpyVn
	sKCPl/E/Msgqhy7RUdtWlTQsjXIzSxhk3UbpJXK7NTAXdqIQBrGVthfYAW8=
X-Google-Smtp-Source: AGHT+IFrWUVq6l1nS395CfiIcyKNT6DSygmpfiB+tI5u/2+sWwofsKb78LA11Ll+t0ii+Gk1Pil+iQ==
X-Received: by 2002:a17:903:287:b0:223:4c09:20b8 with SMTP id d9443c01a7336-22c31abcebbmr17817755ad.37.1744762733812;
        Tue, 15 Apr 2025 17:18:53 -0700 (PDT)
Received: from [192.168.0.101] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef0e90sm1489655ad.2.2025.04.15.17.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:18:53 -0700 (PDT)
Message-ID: <63957942-173e-4c28-932e-a8ba7c60ee83@gmail.com>
Date: Wed, 16 Apr 2025 08:18:49 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: spmi: Add generic SPMI NVMEM
To: fnkl.kernel@gmail.com, Sven Peter <sven@svenpeter.dev>,
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250415-spmi-nvmem-v1-0-22067be253cf@gmail.com>
 <20250415-spmi-nvmem-v1-1-22067be253cf@gmail.com>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250415-spmi-nvmem-v1-1-22067be253cf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Sasha Finkelstein via B4 Relay 於 2025/4/16 清晨5:52 寫道:
> From: Sasha Finkelstein <fnkl.kernel@gmail.com>
>
> Add bindings for exposing SPMI registers as NVMEM cells
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../devicetree/bindings/nvmem/spmi-nvmem.yaml      | 44 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 45 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml b/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..0041babefc37ed4d82d7d6f68fc67d29eed53d9f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
> @@ -0,0 +1,44 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/nvmem/spmi-nvmem.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic SPMI NVMEM
> +
> +description: Exports a series of SPMI registers as NVMEM cells
> +
> +maintainers:
> +  - Sasha Finkelstein <fnkl.kernel@gmail.com>
> +
> +allOf:
> +  - $ref: nvmem.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,maverick-pmu
> +          - apple,sera-pmu
> +          - apple,stowe-pmu
> +      - const: spmi-nvmem
Consider using pmic instead of pmu in the compatible names for consistency (see below).
Also, the PMIC definitely has more (mostly independent) functions than just non-volatile
memory, so I am not sure if it is really appropriate to model it as only a nvmem device.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/spmi/spmi.h>
> +
> +    pmu@f {
> +        compatible = "apple,maverick-pmu", "spmi-nvmem";
> +        reg = <0xf SPMI_USID>;
> +    };

As agreed on the series for SPMI support, this should be pmic@f, not pmu@f.
There should be an nvmem-layout subnode in the example too.


> +
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 96b82704950184bd71623ff41fc4df31e4c7fe87..e7b2d0df81b387ba5398957131971588dc7b89dc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2277,6 +2277,7 @@ F:	Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
>  F:	Documentation/devicetree/bindings/net/bluetooth/brcm,bcm4377-bluetooth.yaml
>  F:	Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
>  F:	Documentation/devicetree/bindings/nvmem/apple,efuses.yaml
> +F:	Documentation/devicetree/bindings/nvmem/spmi-nvmem.yaml
>  F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
>  F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
>  F:	Documentation/devicetree/bindings/power/apple*
>
Nick Chan

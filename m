Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663511D7E37
	for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 16:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744563556; cv=none; b=h/C5E/I5uZW7f9bKUvdXAqHKwkaNQGEYHi0tQEGpG/o66hX0gwm3oNrMry+hsLCm7WR2Eec4rCpMs6nNLnwT5+VTXX0+miiCiFEI50y9+7smoQ4zlF37vN75SiqhU6ey1ISerOkkpxyejshMtoWEa5cfl5o6rrJgSPCFUecpfnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744563556; c=relaxed/simple;
	bh=i17QWzXCS6ZCHtMbXDJ6n/FUUDwlQQ1PwIa3RJGSpqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sanjWGQHC2bM8+vzmXA+T1cwDW8F8AoAgk/PCfgcreZKmn3J7yZzRpUi+2tRIYBjsnRWRuijXIFLhX5DjAaWr1PaDtyzC8OkZIDQkxsbAwZlt8tV258e0Tw1aoKCoIEfOIKfM3xXFOzF7M4a1n9eF0ElyqaRy3eBMGqgSkrS3VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H8ER0MQM; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H8ER0MQM"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-224341bbc1dso31344845ad.3
        for <asahi@lists.linux.dev>; Sun, 13 Apr 2025 09:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744563553; x=1745168353; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=noK0IP3zHzbpqWrnS3yDqlfS/Gp7WWrDNNCpSJyHX2w=;
        b=H8ER0MQMlkS7hwXLwdwrV5/ROA/orWVhCv/B+prZtFJqu6JbLSHUfU9FVlfhQaqMWi
         deIbXA8AbEMIQHXnOJqCCQqBi0AwiE8rfLWqZMjx1LsP8RBFmvditGuDQDT6iiJDE8S3
         NqZ/o91youVz3+7SFEIA2LHPnwdccxfrCy0PNanTTviosPaqWMmXW9NFyz7alfy8qTaD
         APyOriIelK7jT4usgXW+QDd/uXYlv58/w7asERrm3G7Wcp7Mw1x7+O5BqMH1m39UljuQ
         wani4Hqd+t48TkUN8G0Vr3r++ae7E43J0CHy6V99rmfd/x3WA1uQDhXczGuYtHfRw8Q5
         fAZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744563553; x=1745168353;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=noK0IP3zHzbpqWrnS3yDqlfS/Gp7WWrDNNCpSJyHX2w=;
        b=P5dG41NxPNhp29Cx5W7NQGoTeFxw2xWqe5ZojCOE4K1xFSAtqkA0Ld2tOE40usZ470
         iokqhHojw6gWk72Ep7oIxlagjyk23ybaWDF7Ihy2nWyRFSihcBXjjslCNl8KTXTyA/kU
         myatZ46sCJl54CfGZiJk2jHGSNhBbQaOp5bo1t7Po2E0HW67VJpDC5uKy+deZ3A6aMKJ
         92OAD+rIS40LjOTIF6V24fHsZ7SM811QV8iUhQnIGwMD86+glkvxxYdLaI3ONaFQhbFX
         wNUPWMK8PbJecII9XeFbC7ynXRjAzI8AKx+7Qc3Sl3Cj7fPdG32y3ydPhz7guyo+aisC
         17NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHmvteDXlRAxXN6QoxYkU0OHiD4PYOjTn2Jk7BortTxqZp4HRlgQSBFXkqULfBJPRsaKdkRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxpOmZ/iLyf2+MHPaLvSdPRKdZGLkMrBcWg2CMjRfLYCiuzSn3S
	UE+5MV1PKR8PkSQUSomKBR8Hoe3iZZkXOsFzufJoPVZ6IhhZ73FOxHEu9Ev68Q==
X-Gm-Gg: ASbGncsI8QLMMyIEJ3GFjADcL85vnCFQRq4gtW3dvfamPO1S0knfF3BWjFGbIoSlLPK
	LCZEi+/1/pPvcehYGt14O4JsbM74fJqhBFhzA3u/sJ6YwCASeOGvGMwo6sMP44G95KPYPSJIwEI
	pTiNCuF7jYy2vaDuF1eeNqMiIXXN/Wz4JNTew2m1bDCVK5OYKDQ/XSO+SIPBfGNQNoLdPSwRLq1
	zl2lMOWCe1rmNDBA402GBCUVclroyKSo+NIogQ8zoaJuplyUv7qnEUpPAb0FYYxR3vxn+m8AX+7
	LN0ZUBOPl7x1hYzZDoL2fI28deiKL0Jy06NiQysNfOwUAlX+MAVm
X-Google-Smtp-Source: AGHT+IEuuztzcfI3tZMtG2ip7jalzWCYkQqUAle89wyt0wS3flTIjrnot513jepB3231SBdBpBbheQ==
X-Received: by 2002:a17:903:19ed:b0:224:1eaa:5de1 with SMTP id d9443c01a7336-22bea4ade1fmr126350445ad.18.1744563553536;
        Sun, 13 Apr 2025 09:59:13 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8aff9sm84440595ad.79.2025.04.13.09.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 09:59:13 -0700 (PDT)
Date: Sun, 13 Apr 2025 22:29:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Mark Kettenis <mark.kettenis@xs4all.nl>
Subject: Re: [PATCH v3 02/13] dt-bindings: pci: apple,pcie: Add t6020
 compatible string
Message-ID: <754d74knq32vrefkukv4ec7id33d6rvhuf5boccynljfgmn6hz@bzxc7uiqdbos>
References: <20250401091713.2765724-1-maz@kernel.org>
 <20250401091713.2765724-3-maz@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250401091713.2765724-3-maz@kernel.org>

On Tue, Apr 01, 2025 at 10:17:02AM +0100, Marc Zyngier wrote:
> From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> 
> t6020 adds some register ranges compared to t8103, so requires
> a new compatible as well as the new PHY registers.
> 
> Thanks to Mark and Rob for their helpful suggestions in updating
> the binding.
> 
> Suggested-by: Mark Kettenis <mark.kettenis@xs4all.nl>
> Suggested-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Acked-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Tested-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> [maz: added PHY registers, constraints]
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  .../devicetree/bindings/pci/apple,pcie.yaml   | 33 +++++++++++++++----
>  1 file changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/apple,pcie.yaml b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
> index c8775f9cb0713..c0852be04f6de 100644
> --- a/Documentation/devicetree/bindings/pci/apple,pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
> @@ -17,6 +17,10 @@ description: |
>    implements its root ports.  But the ATU found on most DesignWare
>    PCIe host bridges is absent.
>  
> +  On systems derived from T602x, the PHY registers are in a region
> +  separate from the port registers. In that case, there is one PHY
> +  register range per port register range.
> +
>    All root ports share a single ECAM space, but separate GPIOs are
>    used to take the PCI devices on those ports out of reset.  Therefore
>    the standard "reset-gpios" and "max-link-speed" properties appear on
> @@ -30,16 +34,18 @@ description: |
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - apple,t8103-pcie
> -          - apple,t8112-pcie
> -          - apple,t6000-pcie
> -      - const: apple,pcie
> +    oneOf:
> +      - items:
> +          - enum:
> +              - apple,t8103-pcie
> +              - apple,t8112-pcie
> +              - apple,t6000-pcie
> +          - const: apple,pcie
> +      - const: apple,t6020-pcie
>  
>    reg:
>      minItems: 3
> -    maxItems: 6
> +    maxItems: 10
>  
>    reg-names:
>      minItems: 3
> @@ -50,6 +56,10 @@ properties:
>        - const: port1
>        - const: port2
>        - const: port3
> +      - const: phy0
> +      - const: phy1
> +      - const: phy2
> +      - const: phy3
>  
>    ranges:
>      minItems: 2
> @@ -98,6 +108,15 @@ allOf:
>            maxItems: 5
>          interrupts:
>            maxItems: 3
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: apple,t6020-pcie
> +    then:
> +      properties:
> +        reg-names:
> +          minItems: 10
>  
>  examples:
>    - |
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்

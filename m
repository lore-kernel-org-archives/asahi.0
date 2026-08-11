Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6A7409279;
	Tue, 11 Aug 2026 16:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786466682; cv=none; b=d7r6YzGwpTjHwjSQ/OUOuYW0gHVmcn8+OctHsGdsgZbTb06uutmFg2HZipNjAZ9NGJNfIUlqnAUld7HDjdbsKweBvLJiF734Mu6wudL+g2Xl8kt/cbMyJyRYooatc/w+voAeLB/CF26G4ObTsbUSm3vme8kZbFnYwEpn37NNJfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786466682; c=relaxed/simple;
	bh=NQr5Gx1ErrId7IE4jLBe0heyz5frJ9nzhssu3HZztqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d3pmc6HuPL0axWQRONGK2K3+xwKdKTwxilG2xrPsVp26GuPo3zxuaoVOydI9MFI+BI+Z9GbHuM2P6m9+8tx8/BuvVKBuYPR0Myi7kfF3PmjgCRtZ44+XyII9K1+AdrU0l9+pJoM7kmJmkPz7huxDgMeLOdkOTboWWJEbYSwDAzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=McyxGQoK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="McyxGQoK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0686E1F00A3A;
	Tue, 11 Aug 2026 16:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786466676;
	bh=ejjPang1xU/F/9iQxqedxUqRw2rwTNlrqqXQ/ycObk0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=McyxGQoKdhDE7vq8s3suh+8h8i/PIBcr6/65ChoeIgzh5um+Gw4wWS5hVwUtTSVMr
	 stPy41mfXsRRQscxKlTStdpT0AyntLDrMdveDlw02scJwlZXhQJHo+0F+2nJdN/VQ3
	 6Jcd8S2J6p2r0N5hSnwnJk8SX3hdBW9GnRyaTPFp+Odkg2505O3NI/dTKCBAbGLodO
	 jktAdUQUEpI5gV7SbGs4XFij+DEZmiJcwoz9LqjKprTLvlLrp7KWVhQ6OMg2YmK+t3
	 bars+xoGvjf2/PPl/EjkiBEgec2w57d/DGH/Ax3/6fx52qMSMEvbfk74Or/7uEYje0
	 aXnjNC+Y3EURg==
Message-ID: <0b4f3e19-0944-47f4-a113-1e0c2a5af08b@kernel.org>
Date: Tue, 11 Aug 2026 18:44:32 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add Apple SoC CIO reset
To: Conor Dooley <conor@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org>
 <20260809-b4-cio-reset-v1-1-4f33777d9b4b@kernel.org>
 <20260810-unveiled-specked-a856434db8df@spud>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260810-unveiled-specked-a856434db8df@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/10/26 18:02, Conor Dooley wrote:
> On Sun, Aug 09, 2026 at 02:16:02PM +0200, Sven Peter wrote:
>> The CIO (USB4/Thunderbolt) blocks on Apple Silicon SoCs have a reset
>> inside the power manager that has to be deasserted before their
>> co-processor can be booted. On t8103 each port comes with a dedicated
>> register page, represented as a standalone node. On t600x a single
>> register shared by all ports of a die is located in the middle of the
>> PMGR MMIO region instead, represented as a sub-node of the PMGR syscon.
>>
>> Signed-off-by: Sven Peter <sven@kernel.org>
> Fix the sashiko complaint and then
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable
>
>> +  - |
>> +    power-management@28e080000 {
>> +        compatible = "apple,t6000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
>> +        reg = <0x8e080000 0x1c000>;
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +
>> +        reset-controller@1a034 {
>> +            compatible = "apple,t6000-cio-reset";
>> +            reg = <0x1a034 0x4>;
>> +            #reset-cells = <1>;
>> +        };
>> +    };
> Probably the fix is actually moving this to the parent device bnding.

Thanks for the review, I've moved the example to the parent binding 
where I just had to add the reset-controller node itself and could drop 
all the stuff around it.


Thanks,


Sven

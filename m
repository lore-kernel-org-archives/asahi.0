Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794162119;
	b=KaAerD3pGrCiStAJibV9w22gAbywhwf9M7fqGhGux/9eJPqxrfw0B+VqsGt4BCMIeccH
	 xzOt3CvAGfrk4nc4R/BMDbrAfabp7GooQ4Nac+snUxPWLUHin8hM7jMC9m8bAzeuXRzLW
	 7ZRKynE0UNfAAY75TMnlpyEyDT0sblrb55Xo4wV4JVRpNct7HBXFuGKQQeO0PtzA65FLs
	 xvD2rlXTBolmVMbeI8uejGuFJYQ2fv8S+BdIprC4CjLxDZ8OyvIxW71xVusiOEWZYAW0K
	 s1eYnDamniyh9D3krUh2AfQvXy7BMBObrJ0E4+pwd0zbdw9AdbvzxQ5ZwY3UwYzvBHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794162119;
	h=DMARC-Filter:Received:DKIM-Signature:Content-Type:MIME-Version:
	 Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:
	 References:To;
	bh=IEc9ZGuUWt0IoGuerT4chM8IoSWASGRdad0LdA8y7vY=;
	b=qK17RStoSj+5d6B90CEjo3hlbfiY+9VBXGZT9RMm0BfmgwD7Ls/06S45l9gJhNnmo7Rn
	 tDe6FbE1INPMtHMqJgXhySiCuh0yOw+lrvoEiLfnuwodQV2O/fiGfqgIGfdU3TqJ3Gb/p
	 C6LnWnzg8JfDNDAq5ysykvFmC+dMaiqfKUHiBXgGxt3IbYZfpBH368Ne+AfAsCuc6A6wG
	 Y4Ct8z1YzpEnuOUdI3UsaMJoDGLcW4FIzjLKQ/eEj/wAZWiVqGeUzyeIL29sQOX90wXf2
	 gcr/Slu0hGiW+HgbxpOFPf6P6ri60qpyjCbCCeR+R4sygon9f//jpT0Ify0VHoH1+1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=vnZPO7K9;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DD8606A320
	for <asahi@lists.linux.dev>; Sun,  8 Nov 2026 18:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9DD8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=vnZPO7K9
Received: by chaosmail.tech (Postfix) id E1BB61C9627;
	Sun, 08 Nov 2026 18:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1794162114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IEc9ZGuUWt0IoGuerT4chM8IoSWASGRdad0LdA8y7vY=;
	b=vnZPO7K9kRlz8SghCkQLzjjKHdtO6/FrK0I3NE0t7dobQRFY0AGulEeGu+0+k+wsOIpnY6
	qSaYI9iUJw+tZXBFSZURadW3JlutQhW+cSOU4h61BeF5wu9CwxGXKi72lJ/hSjkZjdcp8P
	oKPKITy4nEc80X+NqPAXOBiAfaWvBhA=
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Subject: Re: [PATCH 3/4] phy: apple: atc: Add initial M3 series support
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <4a6ae329-0d73-4ab7-bd87-7acafcb8778b@kernel.org>
Date: Sun, 8 Nov 2026 19:21:43 +0100
Cc: Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>,
 Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <F39FDF3A-E5DB-44F8-A31C-7856F7FA41F9@chaosmail.tech>
References: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
 <20261108-t8122-phy-v1-3-c2783b2a53a8@chaosmail.tech>
 <4a6ae329-0d73-4ab7-bd87-7acafcb8778b@kernel.org>
To: Sven Peter <sven@kernel.org>

On Nov 8, 2026, at 19:17, Sven Peter <sven@kernel.org> wrote:
> 
>>  /**
>>   * struct apple_atcphy - Apple Type-C PHY device struct
>>   * @np: Device node pointer
>> @@ -599,9 +647,10 @@ struct apple_atcphy {
>>   struct apple_tunable *lane_usb4[2];
>>   } tunables;
>>  + const struct atcphy_hw *hw;
>>   enum atcphy_mode mode;
>> - bool swap_lanes;
>>   int dp_link_rate;
>> + bool swap_lanes;
> 
> ugh.. somehow dropped this comment from the email i just sent..
> is there any reason you move swap_lanes around here?

It saves 3 bytes of alignment padding. Yes, it makes no sense on
machines of that performance class, but I could not resist. Can drop it
in v2.


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664B134D382;
	Fri,  3 Jul 2026 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783088439; cv=none; b=uxwqgzZ1i3fbXxH6ugdEqRowEtPkSPZUrperi+hrdzjfnSfCm17HozqSTC1vI0+IJoyOMUyPfQAsar1OZkc4zC5F7jPIEMmHRSBuw59SahovDpsghrRApPIrK7NXDWyoGyb7avQbDOiWw26X0ZtTEYozv4fD0TQ+GKHmu+oAMpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783088439; c=relaxed/simple;
	bh=0Lh2AAUoB1JC5DGuav624QON15nyQOs3xfpPwsgzzqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e92zgGLuuBD2IgcVeXNIsLU/ESZs5/FPb+gJE/uHBRyt6ywWXZvlIS9LTBEuPUcnpiZTkkeJXwLjqqKc9mRsSD4zrWV31y72oKYPLIN/NDyKdHCU6wKo+9k2zp2YxmmsFw+2Zc8vM+eGv/XuptLPBtQ7Q74R6YszI/tkzUdeq0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CV3eauhP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CV3eauhP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 026E31F000E9;
	Fri,  3 Jul 2026 14:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783088438;
	bh=0Lh2AAUoB1JC5DGuav624QON15nyQOs3xfpPwsgzzqs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=CV3eauhPjuGIcDWAuH7jmQQ0azXqPxyCAQx+VyWA76LBoY6RV6Ml8HdSg0GBxbMRe
	 MMzRFWVsjx3hHjyz2RYpJ/tba2gIgRzZioGO4aW1pNYWs8A2kVnZq+aikpl2QaiGNI
	 ENNkHklIR9iq7+exGB3mg2GttfiP0KyXXvEv4T34zFPrYLCXbkGza0Z6jQLCtCo+gT
	 0QhZH+2EGLx1sdF3J8l+/s/vWJFgi/t1MOe7UG439DRWCb3Bh0jmII46SIkiNA1chI
	 YGsizy5zkRaRy1hIhwIt7woYrNdfo3kFDtlHLOpmR2IpHMuvqBBwJR94QWWVNTr0uS
	 iOjlAAjfDkpgQ==
Message-ID: <d12320a3-65fb-4e0d-9f79-69368a708ded@kernel.org>
Date: Fri, 3 Jul 2026 16:20:34 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: apple: Add pmgr-misc nodes to t60xx
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, Rob Herring <robh@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260703-pmgr-misc-v2-0-4b26ba10c5a4@chaosmail.tech>
 <20260703-pmgr-misc-v2-3-4b26ba10c5a4@chaosmail.tech>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260703-pmgr-misc-v2-3-4b26ba10c5a4@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,


On 7/3/26 14:44, Sasha Finkelstein wrote:
> Adds the PMGR misc control nodes for M1/2 Pro/Max/Ultra series devices.
>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>

Thanks,


Sven

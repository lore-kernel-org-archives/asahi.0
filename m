Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD7F377A80;
	Tue, 14 Jul 2026 18:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784054423; cv=none; b=f5sVChcejRnRpIMu8L3D0tIk+yMuncC2OZ4ErnyQXA5mwhXfiwfQ1Htc9WtYAcZe1AQf+h/Qxw5m4LQ00h9FwbrF9KF2og/mSdQmigaO5nQAHs2kLsR7NPS0ytS9m7YI6NNCPLmnN5kEe8gIidfppM6YRbZ5YzZSnrHJ/gZRJXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784054423; c=relaxed/simple;
	bh=znvyPCkEdiKeYivI5ze0b5EULN4zaBPm4/6ksrRIV4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fe2eEr7FvXWRPK+XF6SbGtU9PlqhdxOtMa8hOF9G5wqbY3jWcUwGUV+/wUOkGF1bl25U4j46F5R8r21WBenCc9Y1Wv7TbmX/rQGDguVKWm2y98fVlH+6wzSfAFYE3RBlemWUcDQ9lhWazIGa1FkiRrWO3IHp3uho0M1iJwiQ3CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWttzLoC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWttzLoC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D6BE1F000E9;
	Tue, 14 Jul 2026 18:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784054413;
	bh=nSj4JAQhU4abQQk3qlmUmKoHk4BO6ATzaMq9q+rma+o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mWttzLoCJ3wa6ikXcsYuU7K0BDHpCwW/Ou6zSAENGHHQBYP/sTcI6T5KO4NzMnV5J
	 YsSjGoLjXIgN+b9e5NMXPskyqm8iwg2URngqsR1qSxNhmFZWJhCiz3efZHTmq4wm3T
	 E+e71+DqVwukfxEMrP0Dk+5zYy+mYwZQbP3d1kVEM6Igu1wNO9qUdErbfAVKSJUSsU
	 nc8P/Sm+CXMMh92GRSQudDrGotP+C4RzCv5du1t41zPkg20MMSpe9jZs6G+bjJXJK8
	 0xxfVMqOexlJi8/UtXirxLidJt/ysuYJS8vWToyDVtZ+D3BkgaNOqGvAzDXasN/B7z
	 4N4U/VwPEDMCA==
Message-ID: <5f1d19c5-7a60-439e-903f-1db7953388c5@kernel.org>
Date: Tue, 14 Jul 2026 20:40:09 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] soc: apple: Add "PMGR misc" power controls driver
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh@kernel.org>,
 Neal Gompa <neal@gompa.dev>, Janne Grunau <j@jannau.net>,
 Hector Martin <marcan@marcan.st>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20260705-pmgr-misc-v3-0-51b75fed6f73@chaosmail.tech>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260705-pmgr-misc-v3-0-51b75fed6f73@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/5/26 10:16, Sasha Finkelstein wrote:
> Certain Apple SoCs have additional power state controls that are using
> a separate "misc" mmio interface. Currently this includes the fabric
> and memory controllers on pro/max/ultra SoCs.
>
> This series adds a driver to put those in a low power state when the
> machine enters sleep. The power savings are SoC-dependent and are
> around 1W.
>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>

Thanks, applied! First two patches to apple-soc/drivers-7.3 and the dts 
one to apple-soc/dt-7.3.


Best,


Sven


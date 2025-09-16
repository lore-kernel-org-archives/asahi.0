Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FE930594B;
	Tue, 16 Sep 2025 10:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758018104; cv=none; b=h7zIhWyuHO4shu+Tg11GeSWDsrgsuTK4gnYA0edUnlRGkGSt38jXWwdX3pv/0+iyjo4EI0q5Y68qbf0lpzi+ZKgtrFH8AjbtSKBludHROJ97NPFyW/UCQRzANCnNqmyNDnTPlA9RWK7dl2Vb+SoI9xYrhRxv3NcwEkrDvCD83t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758018104; c=relaxed/simple;
	bh=jOv5Tv4HO/+nI6hQ8fLo8KO6cz67WfuMNY3VLR7Scaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U67/Qn5jhSnmAc5gmXXuFo2zG6Jk3i14h9WQDkf/bitexY9GAD1RemLcscmrB66UiKFB6qQts3n8dFq/gdDmeumAaZYprsFy6IyORsTEnoXnG6JiVJ4D78WTcAqwWXQDod8USFLpBByiiCoNB4PMGgMk1WcRKEQdMqeR5NWY+5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGA1cEbp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGA1cEbp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00D4EC4CEF0;
	Tue, 16 Sep 2025 10:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758018103;
	bh=jOv5Tv4HO/+nI6hQ8fLo8KO6cz67WfuMNY3VLR7Scaw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CGA1cEbp7yOT0VYpobcycEgLRGaJNtFF28oJNDBF4lSDQ8Cc7LWOBPyxYofrjbfZy
	 CxdYRB6wfAMe/yFKCP93Aj2wxQonEWgqJjcVjq0mXP87ZnEpPF4e6ho7s+9E6f6bxl
	 JdsCRWMOs32xRL+LPKdmiGvY7fvQZVA+7nb5hULqtrOsWPBBQ6tcpSarxcQFF+zgE6
	 ZUm0TDSa5NwOzpuwctPUvv6MNm3BduvK4biLhaBuxJ5Lvx5hPRrgBw0RdE2CDmZ3jg
	 Z0gUi34295EGglDkmPrH9b5t6wcWcHmxNRFkOCNo9GSTg/qXuAhPUZKBYGdPbI6kyb
	 wOVako25a5NSA==
Message-ID: <dba79871-672f-4bf1-97df-d9a4471612d7@kernel.org>
Date: Tue, 16 Sep 2025 12:21:38 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] arm64: Add initial device trees for Apple M2
 Pro/Max/Ultra devices
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>,
 Marc Zyngier <maz@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250914-dt-apple-t6020-v2-0-1a738a98bb43@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250914-dt-apple-t6020-v2-0-1a738a98bb43@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.09.25 21:38, Janne Grunau wrote:
> This series adds device trees for Apple's M2 Pro, Max and Ultra based
> devices. The M2 Pro (t6020), M2 Max (t6021) and M2 Ultra (t6022) SoCs
> follow design of the t600x family so copy the structure of SoC *.dtsi
> files.
> 


Hi,

There are a few minor typos in the commit messages that I'll fix up when 
applying this series later this week. LGTM otherwise:

Reviewed-by: Sven Peter <sven@kernel.org>



Best,


Sven


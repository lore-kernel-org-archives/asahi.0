Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4962E265A;
	Wed,  8 Oct 2025 14:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759933261; cv=none; b=PwWyW7DBCfmJnppfmkKFBXFycW0OtRlVPCYAXJGTS0fUnWSJ4XMZDj/Hu+8nCLArv+wMNUcU6w8iBWr4F6QR6AOR6ipQVtsIUUVSsPf1Zfiw+hzN6sYycn6r6p/aYbfCioqB4b0eZwpGQ16RI6oVQN+AaMKucDOPErJ9TF655k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759933261; c=relaxed/simple;
	bh=Sx0SteDPRmJFcqg50YxwV4lcQ6BV5pFc2BTLLbYJImQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VRYSs2eOAF+jihbNBgBwbsiVTtKoVlqiR5HblLFUzzBAqCYU6OYo0pXoBMSfFMU47p2OwE/5bhQytZExPvoVn+S7zLOxeKa7yhdo8frONCnKSDQKZ+5eFynSrhrrmT8RTD72I3IhOtn0keAMAm2STwMSd3jvco8aemFTr1/Wz38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=czJf48Bd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czJf48Bd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9EE4C4CEE7;
	Wed,  8 Oct 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759933261;
	bh=Sx0SteDPRmJFcqg50YxwV4lcQ6BV5pFc2BTLLbYJImQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=czJf48BdGtP5MgMondaHstZGFYGR0tzbfaL68XXOI4uwNSBO1Jv4RQUFPJEfrifZ9
	 rcr0hmc4lb1BkYgE+FO4EHrDTmOq3Hxjrq13wFo+zh0xo1o6wpa5OcLyeix9RKdaWr
	 fN3EMCsjmNnFLTVEVP2Xrn6GE9NSnl0lMbkOQO4ADKIJXnzSfkrlxLKhoHPe039ujz
	 S8aoWS1OFyQ4e87+zQrReV0PeS1bqNHEUhD564fEnlhTUFoWlqTxeRo9WXr1NC7rq6
	 8qBmxi9EuzUPQ4OuShSQIrK0FJRr7175ax7tbxPzfdn1pORS0PjjoL4YNtw3MHn/Iq
	 dgm0MS/vkbcBw==
Message-ID: <82605ddd-d0d8-4449-8bb9-9f94b2bde734@kernel.org>
Date: Wed, 8 Oct 2025 16:20:57 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mfd: macsmc: Initialize mutex
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.09.25 22:33, Janne Grunau wrote:
> Struct apple_smc's mutex was not initialized before use. Surprisingly
> this only resulted in occasional NULL pointer dereferences in
> apple_smc_read() calls from the probe() functions of sub devices.
> 
> Fixes: e038d985c9823 ("mfd: Add Apple Silicon System Management Controller")
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>


Thanks,


Sven


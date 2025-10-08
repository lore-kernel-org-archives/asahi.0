Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A4B266576;
	Wed,  8 Oct 2025 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759933239; cv=none; b=Pnwf+DHczL2VBJTFDLqjzYnmIj1V2kVSSR60g18+qjwcCkDwGoqpGfUUrGnGhENtKw1tpgXPsY1kfybWRcyDUc5F6DB1Wt12lzRN8Kom9yNHMgwY4wZ2tGDcVixhHBgIvRDtItMG2Vm8qAdoeSfT0d1yTb3qR5YjjdaXqD3AplM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759933239; c=relaxed/simple;
	bh=DXLUJwIFDqo9yxA809XtAiU05h5zv726Jm63srA1HqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pupuvkBe4XMhb4gO8R/Oa2UoGXaDHcUYjxzcA9kjn4GN5CxKWshW5V7w9/RA3vutmQHc/PynpOFS39AQMb/fUVo3t2sXydXsp99tPMYiScE0HhdIR9X6m2hjuiZYqpyRuYnfqjfypczrBUdkNrcjQz3eK/9qZpTcvugtb65k9DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sr2HY6nP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sr2HY6nP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD753C4CEE7;
	Wed,  8 Oct 2025 14:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759933239;
	bh=DXLUJwIFDqo9yxA809XtAiU05h5zv726Jm63srA1HqM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sr2HY6nP+YY825+Af6T62I0LEEsgtfcpYEQzMKp+63xt/Et8VIkg5MLMrvDXOK059
	 L0F3U5GiTCsUYcH8wvyTH8JINufV0omW68WAsGedvOsnGio87ZM79i1f3+74EiYn7+
	 8wb/76ku57LJzKSDXB6JxqQTdpB12Us2iU6ektinAsJpzKYBqsULugyCBpop3FoWzI
	 OXhividQD/YC44OtznP6d7ZFUEzyZWj0xYP9TdCyxOUbAmsErqrkomuS/V0BzazfBI
	 EiutAu+evxc8HpF9NaTW4MYJC0m0ZAEjdyrdoQFf9gYAE/WaT9DZynxeEXPpOycfI/
	 Y7dfut7eSbZXA==
Message-ID: <0fa63b77-f912-48de-b67f-6df3acccea61@kernel.org>
Date: Wed, 8 Oct 2025 16:20:35 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] mfd/macsmc: make SMC write buffers const
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Lee Jones <lee@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251007130510.1653-1-atharvatiwarilinuxdev@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20251007130510.1653-1-atharvatiwarilinuxdev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.10.25 15:05, Atharva Tiwari wrote:
> Mark the write buffer arguments in apple_smc_write(), apple_smc_rw(),
> and apple_smc_write_atomic() as const. These functions do not modify
> the data provided by the caller, so the parameters should be const
> qualified.
> 
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
> ---

Reviewed-by: Sven Peter <sven@kernel.org>


Thanks,


Sven



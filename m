Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3018531D371;
	Mon, 13 Apr 2026 19:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776108977; cv=none; b=Obhv1qaOIpWKL5UWBT7nq2JqDH4lnT9IGXOZ3+u9YMZQOy2MyblCPWf9jlsQUj7oL7VTszEx+1214JEPMeKN9I99AuTKleT7PTD95ES8DEEkc/TSp/RMPWyhvdko46iLVZbiemZGU+X6ab7RFmAi5ZtKqsWrypm4Iqftyy1THfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776108977; c=relaxed/simple;
	bh=MO0Ytka59ZQnHYNVwc8gNhlxA933PxFOBNgjc4vISHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SIDGS4YgoChQS9XesWa2X8rvP8eUwac/Q88P1oXtMkn2p4QlcNvpjxBLNdUu8t3xCdns3aswt+071Zb10FJfbgkLRoAZfq1ExYX8DdSPVuqqSXU/al4MoGLlCZgj1wLkzYhsy2ImAqHCBujhUOxuYcyVgz0UA1Mwh1uJ8Nhf3u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYtm7i8o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYtm7i8o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E826C2BCB6;
	Mon, 13 Apr 2026 19:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776108976;
	bh=MO0Ytka59ZQnHYNVwc8gNhlxA933PxFOBNgjc4vISHg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KYtm7i8oH6cvvoAP2XrKRqp7Eo45Dn6bQxOF6++q2uSN4i9kdTe3D1knbBKSssiBW
	 Kpme7sAigdZmKsAUb1icVMIQYyCFjklRtfmkohJlyFLGOD5smK4MQATMRFQBZQvHDu
	 Mo4kwI5EUxxTzN3WgaYFt7GuhxX05/zWGhojSbaiPc3xZKROn071MfECnYSh5rJHgj
	 MSNc9fPtleAUcejJW/UCBhT7mW2CUIy48s0LvIhGy9xstE1xu3fIrAvg/uuS2nPfs3
	 Nnmd6g7ALQwjhSbVIFdPjAJ5jFRFKFq1/+Xvjswfi+n8AC6aewWzD+P/TsxbREPFY5
	 qEHPgszMSM8gw==
Message-ID: <1403462a-4426-4c70-ad14-544a7a2fbb12@kernel.org>
Date: Mon, 13 Apr 2026 21:36:12 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] arm64: dts: apple: fix spelling error
To: Axel Flordal <axel@flordal.net>
Cc: Janne Grunau <j@jannau.net>, asahi@lists.linux.dev,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <2338500.vFx2qVVIhK@fedora>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <2338500.vFx2qVVIhK@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.04.26 09:21, Axel Flordal wrote:
> Change "configiguration" to "configuration".
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Axel Flordal <axel@flordal.net>
> ---
> Original patch: https://lore.kernel.org/asahi/CAEg-Je-KwNNGoi3mpPeNq3Jmtzj_5seuj1Qeh2_1dt994iCJSA@mail.gmail.com/T/#t
> If this is unwanted I of course won't send again.

No, this is perfectly fine. I just totally missed the patch, sorry about 
that.
I'm going to pick it up after the merge window since it doesn't fix an 
urgent bug!



Sven




Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70ADE3A641C;
	Wed, 14 Jan 2026 16:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768409519; cv=none; b=Y+3VE8OPSNWN2s7n1l7q8J1cE9A0j/mDA7bbx1p2edWvA5aQJ9lY5ZZBBnyAdNJH6i+4VFpcy8sIN9RBjQNqsvrtAKf0dT59M5pdDvx/6LWME5eGNt7m5NTEt+VYQfq9DDwYagJSvlO5SG/j7YPTInn0iiOsW5/SLrdySH/zdoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768409519; c=relaxed/simple;
	bh=eqlCfJnhCcOSzYTuVouxRFGgRxB0pW/KJp9s0tKygyY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=e6VslErS8AFZBqz22fRPOC/2hUUkpAPIpw0UFpIMLlFqpR/kNkVP0WwXPb5EVKHm38lGhI+BH6nO3cmOhOhgEhbl9CBAGnxQbN6EDPnis8Kk/LAZX7AcUxiYBKNv5gEYkPogySof2NntZ6kIQKJLe2BOFTSSv/GPXsW8KiskkBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+gKOpMl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+gKOpMl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5081C2BCB0;
	Wed, 14 Jan 2026 16:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768409519;
	bh=eqlCfJnhCcOSzYTuVouxRFGgRxB0pW/KJp9s0tKygyY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=b+gKOpMl1X7HJlzsLPngl16ni5+Dt6EcXJx6uDM/C6Qms+KnILawHmbM/KWKYVmqI
	 J6QLWJ2ADcf0hOODqliXraWI1Xgh3ALNDWjG0Wa/be4sxN9BUOWT70wsYkuNxDUbq3
	 M/qdWw2AxkuAepIhfEFyKS+fyM0o8kRFHGN43pRzcfKlejjLDq3lo0EWvYzkdfFQSl
	 NGFJ6lVGeSeskZeL2oUlAq4HI/c/h5bhrE1FHrNEZIs5xrP/QjBfGld3p5IR3ix4SK
	 UHnz1lujxwEK5wEcFDbiluAN2wCULpqlIExP4+q4A8Eg3w5A4uXA3xvKkuLJaAxHOQ
	 TEQWnVkJ+yrfA==
From: Vinod Koul <vkoul@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
In-Reply-To: <20260108-atcphy-coldboot-fix-v1-1-01c41c6e84f2@kernel.org>
References: <20260108-atcphy-coldboot-fix-v1-1-01c41c6e84f2@kernel.org>
Subject: Re: [PATCH next] phy: apple: atc: Reset USB2 PHY during probe as
 well
Message-Id: <176840951656.979558.11996676069511198685.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 22:21:56 +0530
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 08 Jan 2026 20:12:06 +0100, Sven Peter wrote:
> Now that the upstream Type-C PHY code is getting broader test coverage we
> got reports of USB devices plugged in during boot or those plugged in for
> the first time after boot occasionally not working correctly.
> This is partially caused by the USB2 parts of the PHY being left in an
> unknown state by the previous boot stages. We reset all other parts during
> probe but forgot about the USB2 PHY so let's fix that and actually reset
> and power off the USB2 PHY as well.
> 
> [...]

Applied, thanks!

[1/1] phy: apple: atc: Reset USB2 PHY during probe as well
      commit: bc148def8924e43245c353c52ced47079a5026da

Best regards,
-- 
~Vinod



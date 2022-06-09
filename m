Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBCD7C
	for <asahi@lists.linux.dev>; Thu,  9 Jun 2022 06:51:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FCF7C34114;
	Thu,  9 Jun 2022 06:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654757488;
	bh=nz0AL1nUq9zqtSt05rPkuSm++nyB3Le+WXo70pg/YmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t6X0xtqkC3/2mtCFcIoNaNrGzcyM5pjLQr88Ion/ahl0rNLG69JF6NwuwJ9NaweUL
	 78CYpTHSRad69b5+zfRQQCtl2qrz3SchzvHnhOWddK3cBm3IWPqSWmaG//L9HbyZlk
	 Aelc5FeF47CAKKMqBtRp1zNZ/oF4InDJne4Ko3DgOJJcg4fYWwPsZRSnErqY38bfpa
	 WUgUe5ZeqSxApePm/QpiWt6ISHw+XDtAtoJGLx/1OgnWAf0lqVTgOmVQJwbTDDABNN
	 E09OyF+sVplikad7+QcVv3xue5gxd4q4s2vJk8KkltHPWqNIt9QJqzEWu2kXFfOlkW
	 qoCa67gH4sAfA==
Date: Thu, 9 Jun 2022 12:21:23 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>
Subject: Re: [PATCH v4 0/3] Apple ADMAC driver
Message-ID: <YqGYa/yoj+CG+3Uq@matsya>
References: <20220531213615.7822-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220531213615.7822-1-povik+lin@cutebit.org>

On 31-05-22, 23:36, Martin Povišer wrote:
> Hi,
> 
> I am doing another push of this neglected series which adds support for
> Audio DMA Controller on recent Apple SoCs.

Applied, thanks

-- 
~Vinod

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4D11EEA3D;
	Wed, 15 Jan 2025 09:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736932818; cv=none; b=ll9F9L5l1gRGSOHEe85Hw/D1G+pP3om8GaWAmdvRUj1f2qjddTeqHpu413dbzmapnL1/5G8uQdELyMm+xNV6fPqoOLbMse8CaqurEa0FN7t5qouzhiUrZUMPpRVptGAHkAQGk+QzmEkzRLQ2BBIEiS3PG+1Q+B6UYfl1q1ldQTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736932818; c=relaxed/simple;
	bh=9IC2ITDoqFLeYAWBTaUiKf9L85RT7I7RXmH1ALPuiPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+oxZ1efJSVbyby2bzR2f83nSC/lvbXt0VJLHW5//S4vvZmSYlW1p7p1zmIeYbEWBQX+x9IMCmhrPU0AqIhtDaRoaZ5ExhL+K5k+XgFo4Wfk+XGyvcPgSN+wYB5zxuU0G/cBH1REF0H1o3ZHxG9EFtwhla/a0MIQrNJOe1nxKPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngHQV0YY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngHQV0YY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DB92C4CEDF;
	Wed, 15 Jan 2025 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736932816;
	bh=9IC2ITDoqFLeYAWBTaUiKf9L85RT7I7RXmH1ALPuiPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ngHQV0YYiGUmLQ3GMW/bSgVJyL+0cGa7o5MuWDvPhJiGMa4Vg2QFd79kgYmtc43t1
	 hMeetbu9mkfqT5QC+WL2HsNekIxQzDQyO8jHjIDEpZLHEBPZ5zY/7moJyRvk69exlH
	 jv/UvIrXWeAthY1R0Kj7okaRdvmUwUaaMU0ckPHv0AVkfG6V0AyGurzTQsLxXuhXul
	 ZORvArkMH3ikTu1L32gXYQUhIZnP1O9UhGaf/NfLYsxeG0TZRgcisnb/aVfkLjDFsR
	 sIT2t9vusb3ZgMU0oLr1KqEt3A3wjjTmWViaFM6ALK57Mh52bJhrzDJKzyPfT2lOEG
	 8xnozbUtmFmjg==
Date: Wed, 15 Jan 2025 10:20:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>
Subject: Re: [PATCH v4 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller
Message-ID: <adzdihtqgtyhgr7cdisiekzqqt65uicwmgspyat4vw3kpytqya@3bvq5bnsso3g>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-1-e9b5260a39f1@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250114-adpdrm-v4-1-e9b5260a39f1@gmail.com>

On Tue, Jan 14, 2025 at 10:38:52PM +0100, Sasha Finkelstein wrote:
> Add bindings for a secondary display controller present on certain
> Apple laptops.
> 
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
>  .../display/apple,h7-display-pipe-mipi.yaml        | 83 ++++++++++++++++++++
>  .../bindings/display/apple,h7-display-pipe.yaml    | 88 ++++++++++++++++++++++
>  .../bindings/display/panel/apple,summit.yaml       | 58 ++++++++++++++
>  3 files changed, 229 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD98440861
	for <asahi@lists.linux.dev>; Fri,  8 Mar 2024 16:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709914923; cv=none; b=cu6YbTT9SoY7cx6rxKO6liQ2y4coUG2/2em6ShXmPidiIOWKXo/FuZe1rQ108/ohzSX2h+Ej+aNAP4fmofN6+v04GJqm5KMbsCSEGKW7ehbba0LI4Y7G1VUYMV5cMxr9env4f0uJj4EbtLJmZcgxnI7Z5OgSbD0KIE/hXhL4lEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709914923; c=relaxed/simple;
	bh=ErpHc1wY2DdF0bf6Q9UhJU+DPezctKIzUn/CC0SyCKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIfg7SttiusFHfo9I4PIGKijnWKtuNAKEL1nO/qD4grMRpLDorl99QaPnGCSDytYU7ngc1nP4FuZG6PoTsFpHSh6i55FHo0oAdsniP51NeQRRrQjTkblwJ/GNetBzw9QfVcV1SesDItlL/YoVC5S888l45YHMf5jlrV8cg7n20c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKMl43EN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKMl43EN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A07AAC433F1;
	Fri,  8 Mar 2024 16:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709914922;
	bh=ErpHc1wY2DdF0bf6Q9UhJU+DPezctKIzUn/CC0SyCKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKMl43ENQX2qCLbqhcdxYm18rFTN3J2xk1iLYB9T7z326Q+zdsuDw+WCUOlr7fa46
	 zq1wqHbxNrvotvJ7D0DQcf1OG/PPon7IeIyUyXLO5cdnZ1jvrHAC1UY9UNvFvJhBMu
	 g0Kjbjlsv76rCe2wUXchWPSTU512naV8r9kxaL5jvpm/onAedusnEQf2d09rtGZkUX
	 /8E7xBNpRTOVeNhHx/VR7TMXZNK+bWenKk1tlSskNk6UYBbwIlQDbO0nXGrTVdcSgx
	 5Qd88Z2Z/v6yzzCBTEhTFcJJDfj5wqDaJYGNNbRJt33csSb42XQHzxjMwKYH+ynNx+
	 JcgNGaUwovoPg==
Date: Fri, 8 Mar 2024 09:21:59 -0700
From: Keith Busch <kbusch@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH] nvme-apple: Convert to platform remove callback
 returning void
Message-ID: <Zes7JyArYIajiHtP@kbusch-mbp>
References: <c035aaf3bffc16018d657dd3dab37751da9f3564.1709886922.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c035aaf3bffc16018d657dd3dab37751da9f3564.1709886922.git.u.kleine-koenig@pengutronix.de>

Thanks, applied to nvme-6.9.

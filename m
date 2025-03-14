Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BA11FF7D0
	for <asahi@lists.linux.dev>; Fri, 14 Mar 2025 13:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741960204; cv=none; b=sBhEBeexKRw3kGBNPMbVcZRfsFJWE1B9zWdghrufuac+rzm7OHjBJMyDnajdDVAW+O2jH/Im1YVzw9VwSagNdmPRFlJ8DGrVxaspaia8HWt2jio9bhZxVOpO7NGYbe4aps1XrwNxt8BSU0nTaS0Gt2i1+NVQ2AD35prq1K0qbLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741960204; c=relaxed/simple;
	bh=0um3iODhdtSJSPx10NBW3eU/Ie7n0p9Y448asvFzY7k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=BJKHHl8LfSsA6csPPcRREu7awYMF5qkHqpMph1XDS4ZB0lObfPUR0ZPKQiF2PxMIF0hykkLjBGutyYvgKEih1S5ccWejGd5BKgx1cX4XzgVqlBWq4g8DbvOnGrag9xA2hirgF7WoRKSnqeurpS3K5RXs/15XQSGicqrVEOktKzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=lOsXBqWe; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="lOsXBqWe"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1741960199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U/5knLVWhNBfFd9leGBuomV+x3A+6TFi+unjjwXKU9A=;
	b=lOsXBqWeOxXWT0gOrCN3WOhGLcXDVZdCKgBO8Q1mGUvv40abQIWsL7ssDOv6qdWGheoAG9
	ezTredyQIJiwhlwKbxo51HTlHrdI5wW7lz5f6ccBvlsEBS6wOV4upPfOI0lDCKwD3qLrlv
	4iqOEr36zm0gf+YxEeruohTXmvW36Gmrug5lB/8m5uut7hkEWL9s/YfYNpfVhdtHhmhHrG
	SpNj/CcSrvhHCRUd+M7IPWRTVjsXFixjl62cP1UrvQIpN7mOFelLDws0e1hGJ9AC7oWEbM
	NppZ5wfWU00hKS7BKQ333bAqfizMSk+dNjWYANtOqQ1QEl+adFwoeyEOcYscgg==
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Faith Ekstrand <faith.ekstrand@collabora.com>, 
 Sven Peter <sven@svenpeter.dev>
In-Reply-To: <20250310-apple-twiddled-modifiers-v4-1-1ccac9544808@rosenzweig.io>
References: <20250310-apple-twiddled-modifiers-v4-1-1ccac9544808@rosenzweig.io>
Subject: Re: [PATCH v4] drm: add modifiers for Apple GPU layouts
Message-Id: <174196019716.15076.15894537454426268004.b4-ty@rosenzweig.io>
Date: Fri, 14 Mar 2025 09:49:57 -0400
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On Mon, 10 Mar 2025 15:28:02 -0400, Alyssa Rosenzweig wrote:
> Apple GPUs support non-linear "GPU-tiled" image layouts. Add modifiers
> for these layouts. Mesa requires these modifiers to share non-linear
> buffers across processes, but no other userspace or kernel support is
> required/expected.
> 
> These layouts are notably not used for interchange across hardware
> blocks (e.g. with the display controller). There are other layouts for
> that but we don't support them either in userspace or kernelspace yet
> (even downstream), so we don't add modifiers here.
> 
> [...]

Applied, thanks!

[1/1] drm: add modifiers for Apple GPU layouts
      commit: c8619f5402cbcccfe58151b53421029852473e4c

Best regards,
-- 
Alyssa Rosenzweig <alyssa@rosenzweig.io>


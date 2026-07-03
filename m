Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDC93E1D16
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 14:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783088819; cv=none; b=CFDtomG1B875UFVNQVriXzVfi09dXo4mLlagV1F6Yf7PDYaSbcrzV4RSODyQRWYYt7R+/SIKCFrRd8o1VxojsHNeuajhV3qCo1MBMp84uMHFOj1Ji2pfud7XXPCQ+Dv1o84lc58cWoQZXVVWhHcVaYZMFdiJ6QZOzz8BQfRJsMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783088819; c=relaxed/simple;
	bh=eUnlE9+0l8fJKoLTHs0qb/oMYwfGR8LWWl2uZHjushc=;
	h=Content-Type:MIME-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=mjnhf21lbKFzzAnLTMwk6ozVCka9Mc/mTB6A/M1jYyrIL6wz8HFnW8npIHJEuhI2tDy+SlrKEz/9zu343ere+IgneRca/aTiiXuxbw5SihE7dW6hsslAqzoGGL5Wg3u3plNgjtNSv5rLuQO4N39WhhUPst350OQpz45j0WjBA84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=TU+tJkDB; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="TU+tJkDB"
Received: by chaosmail.tech (Postfix) id E47031CC21E;
	Fri, 03 Jul 2026 14:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1783088814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wKuBmxQ8JnReynxOFnIhAbMgNLWozbwQA/XogGS5Wg0=;
	b=TU+tJkDB8A+jF6w/GXb8peZBii67lRfq1fEtlzuSt6mglAZbbU23DaZiCXxZQl/KGU7SGr
	Ix0bQX9x99yQ5wJH6oPtozF49LXN1rhCvgs28k3bekzPY75tv+GSYsT/dKd8lBJ9Hx6yIO
	dEBy7ydKaLP40tT+f8XXgrq7FXrVbD4=
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] soc: apple: Add driver for Apple PMGR misc
 controls
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <3e7a26e0-5ba5-4440-acd1-ac9547e1d403@kernel.org>
Date: Fri, 3 Jul 2026 16:26:43 +0200
Cc: asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Janne Grunau <j@jannau.net>,
 Hector Martin <marcan@marcan.st>,
 Neal Gompa <neal@gompa.dev>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <4A1676D4-8B60-40E4-8E21-59DF4657BEC6@chaosmail.tech>
References: <20260703-pmgr-misc-v2-0-4b26ba10c5a4@chaosmail.tech>
 <20260703-pmgr-misc-v2-2-4b26ba10c5a4@chaosmail.tech>
 <3e7a26e0-5ba5-4440-acd1-ac9547e1d403@kernel.org>
To: Sven Peter <sven@kernel.org>

On Jul 3, 2026, at 16:19, Sven Peter <sven@kernel.org> wrote:
> 
> Do we know what 7 means here? would be nice to also have that #defined

We do not. Probably a way to pick a clock multiplier or something
similar. On t600x, setting it too low results in other blocks failing
to power up after sleep.


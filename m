Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4CE15EAA
	for <asahi@lists.linux.dev>; Wed, 11 Oct 2023 06:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lees.monster
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lees.monster
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lees.monster header.i=@lees.monster header.b="QrDH/Cq9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lees.monster;
	s=protonmail2; t=1697005800; x=1697265000;
	bh=quadcf+F3w95Vv4EffkoWEgj0LG46W18oiyVW2rhqjk=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=QrDH/Cq9D7Z2EYCH+U+x7B6qF8WTYQQhFEnf4Jmk+2xu2/syk46PF5Mu0EqVg/1W3
	 6i/+bfuVOYqe6+d2ckkpNvi4rGeg3FOPBoe5w94AEFAIxA9IbxDCOxrcBQAQIeI/bN
	 BHWoS3f2SPeWS5PjGzzfrz+GDMGlCvAyjz8Qm9lL0mA8UPAVOFW2uPo8ojB4lNI4dL
	 Mqm/TAnnaMW0nFeMgPR23LXrFYb/dtigV8Cd7LlIhEGqqemfSEjjaksunJFC81D9II
	 z/4EK95QNE1x6mjVwksiEDE20OxhQNsA1LR2h2nVBxVV4FLr5TxMf4KQahmJ22PP4v
	 TyHrT5A6TqC/g==
Date: Wed, 11 Oct 2023 06:29:49 +0000
To: asahi@lists.linux.dev
From: martin <MARTIN@lees.monster>
Subject: (No Subject)
Message-ID: <4ca84442-57e4-4c04-b352-352b089d93d5@lees.monster>
Feedback-ID: 63790775:user:proton
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Empty Message

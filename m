Received: from mail.maslowski.xyz (mail.maslowski.xyz [45.77.158.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3948E3EBF2D
	for <asahi@lists.linux.dev>; Tue, 17 Feb 2026 16:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.77.158.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771344010; cv=none; b=B8pQYLo4XjU/a8RjH7jx3np2L3Y959q2GThc96fZxVej8ceZ77+NvVMquFH9bH0vvcvcEBgToD4WCPqtZE7Qr4dL2/Sq+EkiBisFYhmKpKYz0IWDGBuJk0N3+2+h6WUh2f8pqJ74lhWOxqWCqK2PGBNTdOmin4rfUbIiXK0HM9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771344010; c=relaxed/simple;
	bh=q1BmHhviC6N1jXGhvikFmFlJCnnggZpy+erfgrbZ65s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Xtpv9m/RIB+K1gKOmc847Qz5fkUwiyZqQ1aj45YgpKMts8B5PgZV2qqK0BAXw3WwCIQqBUif+j6OrtjEHCUenkXO5fe0DGtpiLdo4i6s3jtS8jk75xCJ0o/0fHLQACLHG8iOG1L1FOC30oUJcEnbwJITl4cjQvZ+YKhUBGPWYD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=maslowski.xyz; spf=pass smtp.mailfrom=maslowski.xyz; dkim=pass (2048-bit key) header.d=maslowski.xyz header.i=@maslowski.xyz header.b=Cd7Jqhiq; arc=none smtp.client-ip=45.77.158.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=maslowski.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maslowski.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maslowski.xyz header.i=@maslowski.xyz header.b="Cd7Jqhiq"
Received: from localhost (unknown [IPv6:2a00:f41:3430:d49a:a81b:6380:9404:ab0b])
	by mail.maslowski.xyz (Postfix) with ESMTPSA id CB78C7D59F;
	Tue, 17 Feb 2026 15:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=maslowski.xyz;
	s=mail; t=1771343518;
	bh=q1BmHhviC6N1jXGhvikFmFlJCnnggZpy+erfgrbZ65s=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=Cd7JqhiqpKq+Sge5NdLTGtBZxPvJONgnCEQFvBs/aYcpqFC1AmgKpywSDY6tMigdp
	 DvL2W9L2oiLunM06DOGu39raIDhqhxCMB86UwYXnxsL26KsCXi7s1NBrTWGnZdw/+f
	 BVDi5WODWY68Rs4Wtz2ho7l/EmDQ0v1SUvyPLZnp6VB6IUjiCDkOYxpcYk33ZCWdMH
	 OGywc2an5LMZKUKeB2NYptdWNHlFUaRgYK33to9VDHgPzIvvaQNWgDRJDTCeyPwL5b
	 21GkZqgQ5Tqw6N1kdTChp+YCKTXX8NnVohuNvY6qvKyWZcH7qq63HAo7BAo9S/Dbo6
	 Uhja00DGffiKw==
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 16:51:54 +0100
Message-Id: <DGHCVCRACU6X.2KYOL2RQWEUG7@maslowski.xyz>
Subject: Re: [PATCH] sound: soc: Add SPDX ids to many soc files
From: =?utf-8?q?Piotr_Mas=C5=82owski?= <piotr@maslowski.xyz>
To: "Tim Bird" <tim.bird@sony.com>
Cc: <perex@perex.cz>, <tiwai@suse.com>, <lgirdwood@gmail.com>,
 <broonie@kernel.org>, <povik+lin@cutebit.org>, <david.rhodes@cirrus.com>,
 <rf@opensource.cirrus.com>, <cezary.rojewski@intel.com>,
 <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
 <ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
 <linux-spdx@vger.kernel.org>, <asahi@lists.linux.dev>,
 <patches@opensource.cirrus.com>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260214004314.3787727-1-tim.bird@sony.com>
In-Reply-To: <20260214004314.3787727-1-tim.bird@sony.com>

Hello!

On Sat Feb 14, 2026 at 1:43 AM CET, Tim Bird wrote:
> Add appropriate SPDX-License-Identifier lines to the
> the remaining files that are missing such lines in the
> sound/soc directory, and in a few other miscelaneous files.
> Remove boilerplate license text.
>
[...]

> +# SPDX-License-Identifier: GPL-2.0-only
[...]
> +# SPDX-License-Identifier: GPL-2.0

Is there some intended meaning behind this distinction? Bear in mind
I'm not a kernel developer so I might very well be missing something,
but AFAIK the `GPL-2.0` SPDX identifier is just an older, deprecated
variant with the same meaning as `GPL-2.0-only`. (Just like `GPL-2.0+`
which is a deprecated version of `GPL-2.0-or-later`.)

Anyway, this patch looks like a nice improvement.

[...]

Best regards,
Piotr Mas=C5=82owski

Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2B9221F2D
	for <asahi@lists.linux.dev>; Sat, 22 Mar 2025 13:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742649809; cv=none; b=jbSZK6c+p3A3KAcPY42ENQJX9y0WzWnXecVEBEOBHXkJPs0WDRMH+SRoqIceWRKmUf9NiapkzTLFNSJrmuzpiZlihvmLJdN1dzExWJj3t3OwWC6NrEaoWKnmjOSmNRfcEjGQmiAiyM75PQruIHvVKtQzuTPC4PfJuM6sMKDUCAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742649809; c=relaxed/simple;
	bh=GNWhqIPtbxtPCtd8D13F1J71Bey1g0P410ONxS5nW54=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F++uD7i+iIEcIm8KXUf+VP2cT/WaTo+/u+ql3rO0Fpln7qzY0ZniToSgLBoCSVb3KKJ/6lQDaV+EWsYkXO3O1l8dptzLV7CdY+E9Qqadr0/+Pg6LQmkC/Cx5MKfb9ujGCzmLdsCkMbQZbxjE5SpxBqKFs5VOULg9aVb1Wb6hvaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id c7ad57d1-0720-11f0-95fc-005056bdd08f;
	Sat, 22 Mar 2025 15:23:04 +0200 (EET)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 22 Mar 2025 15:23:01 +0200
To: Andi Shyti <andi.shyti@kernel.org>
Cc: sven@svenpeter.dev, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 1/4] i2c: pasemi: Add registers bits and switch to BIT()
Message-ID: <Z965tVhC5jxy1kqZ@surfacebook.localdomain>
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
 <20250222-pasemi-fixes-v1-1-d7ea33d50c5e@svenpeter.dev>
 <rjvak3c2k5a64jw4ef23i5uptg4zzl3u7lqszqbg56l4hqms77@hrkn5eydxwiy>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rjvak3c2k5a64jw4ef23i5uptg4zzl3u7lqszqbg56l4hqms77@hrkn5eydxwiy>

Thu, Mar 20, 2025 at 01:23:25AM +0100, Andi Shyti kirjoitti:
> Hi Sven,
> 
> On Sat, Feb 22, 2025 at 01:38:33PM +0000, Sven Peter via B4 Relay wrote:
> > From: Sven Peter <sven@svenpeter.dev>
> > 
> > Add the missing register bits to the defines and also switch
> > those to use the BIT macro which is much more readable than
> > using hardcoded masks
> > 
> > Co-developed-by: Hector Martin <marcan@marcan.st>
> > Signed-off-by: Hector Martin <marcan@marcan.st>
> > Signed-off-by: Sven Peter <sven@svenpeter.dev>
> 
> Just this patch merged to i2c/i2c-host.

This needs an update as well. The proper header for BIT() et al. is bits.h.
bitfield.h is for FIELD_*() et al.

-- 
With Best Regards,
Andy Shevchenko


